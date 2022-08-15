---
title: Kubernetes Kubelet 代码走读
date: 2022-01-15 11:23:11
tags:
  - Kubenetes
categories: 
  - 云原生
  - Kubernetes
  - code
---

<p></p>
<!-- more -->

```golang

server.go:NewKubeletCommand()-->>
kubeletDeps, err := UnsecuredDependencies(kubeletServer, utilfeature.DefaultFeatureGate)-->>
	plugins, err := ProbeVolumePlugins(featureGate)
server.go:Run(kubeletServer, kubeletDeps, utilfeature.DefaultFeatureGate, stopCh)-->>
	run(s, kubeDeps, featureGate, stopCh)-->>
		kubeDeps.ContainerManager, err = cm.NewContainerManager() // init runtime service(CRI), -container-runtime=remote --runtime-request-timeout=15m --container-runtime-endpoint=unix:///var/containerd/containerd.sock
		kubelet.PreInitRuntimeService()-->>
			remote.NewRemoteRuntimeService(remoteRuntimeEndpoint, kubeCfg.RuntimeRequestTimeout.Duration)
		RunKubelet(s, kubeDeps, s.RunOnce)-->>
			createAndInitKubelet()-->>
				kubelet.NewMainKubelet()-->>
					makePodSourceConfig(kubeCfg, kubeDeps, nodeName, bootstrapCheckpointPath)-->>
						updatechannel = cfg.Channel(kubetypes.ApiserverSource)
					klet := &Kubelet{}
					//*******init volume plugins
					runtime, err := kuberuntime.NewKubeGenericRuntimeManager()
					NewInitializedVolumePluginMgr()-->>
						kvh.volumePluginMgr.InitPlugins(plugins, prober, kvh)-->>
			startKubelet()-->>
				k.Run(podCfg.Updates())-->>
					//*******run volume manager, and reconcile function would attach volume for attachable plugin and mount volume
					go kl.volumeManager.Run(kl.sourcesReady, wait.NeverStop)-->>
						vm.desiredStateOfWorldPopulator.Run(sourcesReady, stopCh)-->>
							populatorLoop-->>
								dswp.findAndAddNewPods()-->>
									dswp.processPodVolumes(pod, mountedVolumesForPod, processedVolumesForFSResize)-->>
										mounts, devices := util.GetPodVolumeNames(pod)
										dswp.createVolumeSpec(podVolume, pod.Name, pod.Namespace, mounts, devices)
										dswp.desiredStateOfWorld.AddPodToVolume(uniquePodName, pod, volumeSpec, podVolume.Name, volumeGidValue)-->>
											dsw.volumesToMount[volumeName] = volumeToMount{}
						vm.reconciler.Run(stopCh)-->>	
							reconciliationLoopFunc() -->> // reconcile every 100 ms
								mountAttachVolumes-->>
									rc.desiredStateOfWorld.GetVolumesToMount()
									rc.operationExecutor.AttachVolume()-->>	// attachable plugin, e.g. 	CSI plugin
										operationGenerator.GenerateAttachVolumeFunc(volumeToAttach, actualStateOfWorld).Run()
									rc.operationExecutor.MountVolume()-->>  // volume need to mount, like ceph, configmap, emptyDir
										oe.operationGenerator.GenerateMapVolumeFunc().Run()-->>
											volumePlugin, err := og.volumePluginMgr.FindPluginBySpec(volumeToMount.VolumeSpec)
											volumePlugin.NewMounter()
											volumeMounter.SetUp()
					kl.syncLoop(updates, kl)-->>
						kl.syncLoopIteration(updates, handler, syncTicker.C, housekeepingTicker.C, plegCh)-->>
							//*******handle pod creation event
							handler.HandlePodAdditions(u.Pods)-->>
								kl.podManager.AddPod(pod)
								kl.canAdmitPod(activePods, pod) // check admit, if admit check fail, it will error out
								kl.dispatchWork(pod, kubetypes.SyncPodCreate, mirrorPod, start)-->>
									kl.podWorkers.UpdatePod()-->>
										p.managePodLoop(podUpdates)-->>
											p.syncPodFn()-->>
												kubelet.go:syncPod()-->>
													runnable := kl.canRunPod(pod) // check soft admin, pod will be pending if check fails
													kl.runtimeState.networkErrors() // check network plugin status
													kl.containerManager.UpdateQOSCgroups()
													kl.makePodDataDirs(pod)
													kl.volumeManager.WaitForAttachAndMount(pod)
													(kubeGenericRuntimeManager)kl.containerRuntime.SyncPod()-->>
														m.computePodActions(pod, podStatus) // create sandbox container?
														m.createPodSandbox(pod, podContainerChanges.Attempt)-->>
															m.osInterface.MkdirAll(podSandboxConfig.LogDirectory, 0755)
															//*******calling CRI
															m.runtimeService.RunPodSandbox(podSandboxConfig, runtimeHandler)-->>// k8s.io/cri-api/pkg/apis/runtime/v1alpha2/api.pb.go
																c.cc.Invoke(ctx, "/runtime.v1alpha2.RuntimeService/RunPodSandbox") // call remote runtime service which is served by containerd
															start("init container", containerStartSpec(container))-->>
																startContainer()
															start("container", containerStartSpec(&pod.Spec.Containers[idx]))-->>
																startContainer()-->>
																	m.imagePuller.EnsureImageExists(pod, container, pullSecrets, podSandboxConfig)-->>
																		c.cc.Invoke(ctx, "/runtime.v1alpha2.ImageService/PullImage"
																	m.runtimeService.CreateContainer(podSandboxID, containerConfig, podSandboxConfig)-->>
																		c.cc.Invoke(ctx, "/runtime.v1alpha2.RuntimeService/CreateContainer")
																	m.internalLifecycle.PreStartContainer(pod, container, containerID) // set cpu set
																	m.runtimeService.StartContainer(containerID)-->>
																		c.cc.Invoke(ctx, "/runtime.v1alpha2.RuntimeService/StartContainer")
															
containerd
server.go:service.Register(grpcServer)-->>
	runtime.RegisterRuntimeServiceServer(s, instrumented)-->>
			s.RegisterService(&_RuntimeService_serviceDesc, srv)-->>
				Handler:    _RuntimeService_RunPodSandbox_Handler,	// api.pb.go
				srv.(RuntimeServiceServer).RunPodSandbox(ctx, in)-->> //"/runtime.v1alpha2.RuntimeService/RunPodSandbox"
					RunPodSandbox()-->> // pkg/server/sandbox_run.go
						sandboxstore.NewSandbox()
						c.ensureImageExists()
						c.getSandboxRuntime(config, r.GetRuntimeHandler())
						netns.NewNetNS()
						c.setupPodNetwork(ctx, &sandbox)-->>
							c.netPlugin.Setup(ctx, id, path, opts...)-->>
								network.Attach(ctx, ns)-->>
									n.cni.AddNetworkList(ctx, n.config, ns.config(n.ifName))-->>
										c.addNetwork(ctx, list.Name, list.CNIVersion, net, result, rt)-->>// for each network plugin
											c.exec.FindInPath(net.Network.Type, c.Path)
											buildOneConfig(name, cniVersion, net, prevResult, rt)
											invoke.ExecPluginWithResult(ctx, pluginPath, newConf.Bytes, c.args("ADD", rt), c.exec)
						c.client.NewContainer(ctx, id, opts...)
						c.os.MkdirAll(sandboxRootDir, 0755)
						c.os.MkdirAll(volatileSandboxRootDir, 0755)
						c.setupSandboxFiles(id, config)
						container.NewTask(ctx, containerdio.NullIO, taskOpts...)
						task.Start(ctx)-->>
							c.client.TaskService().Create(ctx, request)-->>
								s.local.Create(ctx, r)-->>
									l.getRuntime(container.Runtime.Name)
									rtime.Create(ctx, r.ContainerID, opts)-->>
										b := shimBinary(ctx, bundle, opts.Runtime, m.containerdAddress, m.containerdTTRPCAddress, m.events, m.tasks)
										b.Start()
										shim.Create(ctx, opts)-->>
											c.client.Call(ctx, "containerd.task.v2.Task", "Create", req, &resp)


	runtime.RegisterImageServiceServer(s, instrumented)

```


<p hidden>
参考
[kubelet](https://cncamp.notion.site/kubelet-go-c3b5cf9bbf4b4e3098720f61efb15e0e)
</p>
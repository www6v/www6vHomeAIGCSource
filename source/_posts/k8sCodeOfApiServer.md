---
title: Kubernetes ApiServer 代码走读
date: 2022-01-15 22:23:20
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
  - code
---

<p></p>
<!-- more -->

## Kubernetes ApiServer 代码走读

```golang
cmd/kube-apiserver/app/server.go:NewAPIServerCommand()-->
completedOptions, err := Complete(s)-->
	s.Etcd.WatchCacheSizes, err = serveroptions.WriteWatchCacheSizes(sizes)
Run(completedOptions, genericapiserver.SetupSignalHandler())-->CreateServerChain()-->
	CreateServerChain()-->
		CreateKubeAPIServerConfig-->
			buildGenericConfig(s.ServerRunOptions, proxyTransport)-->
				genericapiserver.NewConfig(legacyscheme.Codecs) // create codec factory for encoding/decoding
				controlplane.DefaultAPIResourceConfigSource() // group version: enabled/disabled
				storageFactoryConfig.Complete(s.Etcd)
				completedStorageFactoryConfig.New()--> // register access path in etcd for all k8s objects
					storageFactory.AddCohabitatingResources(networking.Resource("networkpolicies"), extensions.Resource("networkpolicies"))
				s.Etcd.ApplyWithStorageFactoryTo(storageFactory, genericConfig)-->
					c.AddHealthChecks()
					c.RESTOptionsGetter = &StorageFactoryRestOptionsFactory{Options: *s, StorageFactory: factory}
// 认证
				s.Authentication.ApplyTo()--> // clientcert, serviceaccount, bootstrap token, 
					authenticatorConfig.New()-->
						newWebhookTokenAuthenticator(config) // webhook
// 鉴权
				BuildAuthorizer(s, genericConfig.EgressSelector, versionedInformers)-->
					authorizationConfig.New()-->
						rbacAuthorizer := rbac.New()--> // if authorizer type is rbac
// 准入
				buildServiceResolver(s.EnableAggregatorRouting, genericConfig.LoopbackClientConfig.Host, versionedInformers)
				admissionConfig.New(proxyTransport, genericConfig.EgressSelector, serviceResolver)-->
					admission.PluginInitializer{webhookPluginInitializer, kubePluginInitializer}

			net.SplitHostPort(s.Etcd.StorageConfig.Transport.ServerList[0])
			utilwait.PollImmediate(etcdRetryInterval, etcdRetryLimit*etcdRetryInterval, preflight.EtcdConnection{ServerList: s.Etcd.StorageConfig.Transport.ServerList}.CheckEtcdServers)
			capabilities.Initialize() // allow privillage?
			config := &controlplane.Config{}
		createAPIExtensionsConfig()
		createAPIExtensionsServer()-->
			apiextensionsConfig.Complete().New(delegateAPIServer)-->
				s.AddHealthChecks(delegateCheck)
// 注册通用handler
				installAPI(s, c.Config) // register generic api handler e.g. index, profiling, metrics, flow control
		CreateKubeAPIServer(kubeAPIServerConfig, apiExtensionsServer.GenericAPIServer)
			kubeAPIServerConfig.Complete().New(delegateAPIServer)
				m.InstallLegacyAPI(&c, c.GenericConfig.RESTOptionsGetter, legacyRESTStorageProvider)-->
					m.GenericAPIServer.AddPostStartHookOrDie(controllerName, bootstrapController.PostStartHook)-->
						controlplane.controller.Start()-->
							async.NewRunner(c.RunKubernetesNamespaces, c.RunKubernetesService, repairClusterIPs.RunUntil, repairNodePorts.RunUntil)
					m.GenericAPIServer.AddPreShutdownHookOrDie(controllerName, bootstrapController.PreShutdownHook)
// 注册core group API handler
					m.GenericAPIServer.InstallLegacyAPIGroup() // register handler for /api
					restStorageProviders := []RESTStorageProvider{appsrest.StorageProvider{}}
				m.InstallAPIs(c.ExtraConfig.APIResourceConfigSource, c.GenericConfig.RESTOptionsGetter, restStorageProviders...)-->
// 初始化对应group中对象的watch cache
					restStorageBuilder.NewRESTStorage(apiResourceConfigSource, restOptionsGetter)--> // trigger appsrest.StorageProvider
						p.v1Storage(apiResourceConfigSource, restOptionsGetter)-->
							daemonsetstore.NewREST(restOptionsGetter)-->
								store.CompleteWithOptions(options)-->
									opts, err := options.RESTOptions.GetRESTOptions(e.DefaultQualifiedResource)--> // etcd.go
										ret.Decorator = genericregistry.StorageWithCacher()-->
											cacherstorage.NewCacherFromConfig(cacherConfig)-->
												watchCache := newWatchCache()-->
// 注册API handler
					m.GenericAPIServer.InstallAPIGroups(apiGroupsInfo...)-->  // register handler for /apis
						s.installAPIResources(APIGroupPrefix, apiGroupInfo, openAPIModels)-->
							apiGroupVersion.InstallREST(s.Handler.GoRestfulContainer)-->
								discovery.NewAPIVersionHandler(g.Serializer, g.GroupVersion, staticLister{apiResources})
		createAggregatorServer(aggregatorConfig, kubeAPIServer.GenericAPIServer, apiExtensionsServer.Informers)-->
			apiServices := apiServicesToRegister(delegateAPIServer, autoRegistrationController)
	server.PrepareRun()-->
		s.GenericAPIServer.PrepareRun()-->
			s.installHealthz()
			s.installLivez()
			s.installReadyz()
	prepared.Run(stopCh)-->
		s.runnable.Run(stopCh)--> // preparedGenericAPIServer.Run()
			s.NonBlockingRun(delayedStopCh)-->
				s.SecureServingInfo.Serve(s.Handler, s.ShutdownTimeout, internalStopCh)-->
					RunServer(secureServer, s.Listener, shutdownTimeout, stopCh)
```

<p hidden>
参考
[kube-apiserver](https://cncamp.notion.site/kube-apiserver-10d5695cbbb14387b60c6d622005583d)
</p>
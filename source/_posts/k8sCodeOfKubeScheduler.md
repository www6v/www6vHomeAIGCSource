---
title: Kubernetes KubeScheduler 代码走读
date: 2022-01-15 10:56:28
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

// Framework manages the set of plugins in use by the scheduling framework.
// Configured plugins are called at specified points in a scheduling context.
type Framework interface {
	Handle
	QueueSortFunc() LessFunc
	RunPreFilterPlugins(ctx context.Context, state *CycleState, pod *v1.Pod) *Status
	RunPostFilterPlugins(ctx context.Context, state *CycleState, pod *v1.Pod, filteredNodeStatusMap NodeToStatusMap) (*PostFilterResult, *Status)
	RunPreBindPlugins(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string) *Status
	RunPostBindPlugins(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string)
	RunReservePluginsReserve(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string) *Status
	RunReservePluginsUnreserve(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string)
	RunPermitPlugins(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string) *Status
	WaitOnPermit(ctx context.Context, pod *v1.Pod) *Status
	RunBindPlugins(ctx context.Context, state *CycleState, pod *v1.Pod, nodeName string) *Status
	HasFilterPlugins() bool
	HasPostFilterPlugins() bool
	HasScorePlugins() bool
	ListPlugins() *config.Plugins
	ProfileName() string
}

Schedule()-->
	// filter
	g.findNodesThatFitPod(ctx, extenders, fwk, state, pod)-->
		// 1.filter预处理阶段：遍历pod的所有initcontainer和主container，计算pod的总资源需求
		s := fwk.RunPreFilterPlugins(ctx, state, pod) // e.g. computePodResourceRequest
		// 2. filter阶段，遍历所有节点，过滤掉不符合资源需求的节点
		g.findNodesThatPassFilters(ctx, fwk, state, pod, diagnosis, allNodes)-->
			fwk.RunFilterPluginsWithNominatedPods(ctx, state, pod, nodeInfo)-->
				s, err := getPreFilterState(cycleState)
				insufficientResources := fitsRequest(s, nodeInfo, f.ignoredResources, f.ignoredResourceGroups)
		// 3. 处理扩展plugin
		findNodesThatPassExtenders(extenders, pod, feasibleNodes, diagnosis.NodeToStatusMap)
		// score
	prioritizeNodes(ctx, extenders, fwk, state, pod, feasibleNodes)-->
		// 4. score，比如处理弱亲和性，将preferredAffinity语法进行解析
		fwk.RunPreScorePlugins(ctx, state, pod, nodes) // e.g. nodeAffinity
		fwk.RunScorePlugins(ctx, state, pod, nodes)-->
		// 5. 为节点打分
			f.runScorePlugin(ctx, pl, state, pod, nodeName) // e.g. noderesource fit
		// 6. 处理扩展plugin
		extenders[extIndex].Prioritize(pod, nodes)
		// 7.选择节点
		g.selectHost(priorityList)
sched.assume(assumedPod, scheduleResult.SuggestedHost)-->
	  // 8.假定选中pod
	sched.SchedulerCache.AssumePod(assumed)-->
fwk.RunReservePluginsReserve(schedulingCycleCtx, state, assumedPod, scheduleResult.SuggestedHost)-->
	f.runReservePluginReserve(ctx, pl, state, pod, nodeName) // e.g. bindVolume。其实还没大用
runPermitStatus := fwk.RunPermitPlugins(schedulingCycleCtx, state, assumedPod, scheduleResult.SuggestedHost)-->
	f.runPermitPlugin(ctx, pl, state, pod, nodeName) // empty hook
fwk.RunPreBindPlugins(bindingCycleCtx, state, assumedPod, scheduleResult.SuggestedHost) // 同 runReservePluginReserve
		// bind
		// 9.绑定pod
sched.bind(bindingCycleCtx, fwk, assumedPod, scheduleResult.SuggestedHost, state)-->
	f.runBindPlugin(ctx, bp, state, pod, nodeName)-->
		b.handle.ClientSet().CoreV1().Pods(binding.Namespace).Bind(ctx, binding, metav1.CreateOptions{})-->
			return c.client.Post().Namespace(c.ns).Resource("pods").Name(binding.Name).VersionedParams(&opts, scheme.ParameterCodec).SubResource("binding").Body(binding).Do(ctx).Error()

```


<p hidden>
参考
[kube-scheduler](https://cncamp.notion.site/kube-scheduler-0d45b37a5c9a46008aaf9f9e2088b3ce)
</p>
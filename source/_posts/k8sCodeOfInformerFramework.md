---
title: Kubernetes Informer Framework 代码走读
date: 2022-01-15 22:14:03
tags:
  - Kubernetes
categories: 
  - 云原生
  - Kubernetes
  - code
---

<p></p>
<!-- more -->

```golang

secretInformer := kubecoreinformers.NewSecretInformer()-->
	NewFilteredSecretInformer()-->
		NewSharedIndexInformer(&cache.ListWatch{}, &corev1.Secret{}, resyncPeriod, indexers)-->
			sharedIndexInformer := &sharedIndexInformer{
				processor:                       &sharedProcessor{clock: realClock},
				indexer:                         NewIndexer(DeletionHandlingMetaNamespaceKeyFunc, indexers),
				listerWatcher:                   lw,
				objectType:                      exampleObject,
				resyncCheckPeriod:               defaultEventHandlerResyncPeriod,
				defaultEventHandlerResyncPeriod: defaultEventHandlerResyncPeriod,
				cacheMutationDetector:           NewCacheMutationDetector(fmt.Sprintf("%T", exampleObject)),
				clock:                           realClock,
			}

secretInformer.AddEventHandler()-->
	AddEventHandlerWithResyncPeriod()-->
		listener := newProcessListener(handler, resyncPeriod, determineResyncPeriod(resyncPeriod, s.resyncCheckPeriod), s.clock.Now(), initialBufferSize)-->
			ret := &processorListener{
				nextCh:                make(chan interface{}),
				addCh:                 make(chan interface{}),
				handler:               handler,
				pendingNotifications:  *buffer.NewRingGrowing(bufferSize),
				requestedResyncPeriod: requestedResyncPeriod,
				resyncPeriod:          resyncPeriod,
			}
		s.processor.addListener(listener)
			listener.run()-->
				for next := range p.nextCh {
					p.handler.OnUpdate(notification.oldObj, notification.newObj)
					p.handler.OnAdd(notification.newObj)
					p.handler.OnDelete(notification.oldObj)
				}
			listener.pop()-->
				for {
					select {
					case nextCh <- notification:
						notification, ok = p.pendingNotifications.ReadOne()
					case notificationToAdd, ok := <-p.addCh:
							p.pendingNotifications.WriteOne(notificationToAdd)
				}
		for _, item := range s.indexer.List() {
			listener.add(addNotification{newObj: item})-->
				p.addCh <- notification
		}

go secretInformer.Run(ctx.Stop)
	fifo := NewDeltaFIFOWithOptions()
	cfg := &Config{
			Queue:            fifo,
			ListerWatcher:    s.listerWatcher,
			ObjectType:       s.objectType,
			FullResyncPeriod: s.resyncCheckPeriod,
			RetryOnError:     false,
			ShouldResync:     s.processor.shouldResync,
	
			Process: s.HandleDeltas,
		}
	wg.StartWithChannel(processorStopCh, s.cacheMutationDetector.Run)
	wg.StartWithChannel(processorStopCh, s.processor.run)
	s.controller = New(cfg)
	s.controller.Run(stopCh)-->
		r := NewReflector(
			c.config.ListerWatcher,
			c.config.ObjectType,
			c.config.Queue,
			c.config.FullResyncPeriod,
		)
		wg.StartWithChannel(stopCh, r.Run)-->
			r.ListAndWatch(stopCh)-->
				list := pager.List(context.Background(), options) (1)
				items, err := meta.ExtractList(list)
				r.syncWith(items, resourceVersion)-->
					r.store.Replace(found, resourceVersion) (2)
				r.watchHandler(start, w, &resourceVersion, resyncerrc, stopCh)-->
					r.store.Update(event.Object)
		c.processLoop-->
			c.config.Queue.Pop(PopProcessFunc(c.config.Process))//HandleDeltas
				for _, d := range obj.(Deltas) {
					s.processor.distribute(updateNotification)
					s.processor.distribute(addNotification)
					s.processor.distribute(deleteNotification)
				}

```

<p hidden>
参考
[informer framework](https://cncamp.notion.site/informer-framework-31ba746049ec472fb405e61482ed762f)
</p>
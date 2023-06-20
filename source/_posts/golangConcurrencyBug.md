---
title: Golang 并发Bug
date: 2022-06-20 13:50:38
tags:
  - Golang
categories:
  - Golang 
  - Concurrency
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

#  死锁 [1]
+ 通过pprof进入goroutine页面查看

[gpt]
在Golang中，互斥锁（Mutex）是不支持重入的，如果在一个goroutine中已经获得了互斥锁的锁并且没有释放，那么在同一个goroutine中再次尝试获取该锁时会导致死锁。

这是因为互斥锁是一个排他锁，当一个goroutine获取了互斥锁的锁之后，其他的goroutine就不能再获取该锁，直到该goroutine释放该锁。如果同一个goroutine再次获取该锁，就会导致死锁。

不过，在Golang中也提供了另外一种锁——**读写锁（RWMutex）**，它是支持**重入**的。读写锁允许多个goroutine同时读取共享资源，但在写入时必须独占访问。读写锁内部有一个计数器，用于记录已经获取读锁的goroutine数量，因此同一个goroutine获取读锁是可以重入的。但是，当一个goroutine获取了写锁时，它不能再获取读锁，否则也会导致死锁。

总之，**互斥锁不支持重入，而读写锁支持重入**。在使用锁的时候应该根据实际情况选择合适的锁来避免死锁的发生。
[/gpt]

### example1 [1]
``` go
func m() {
	b.Lock()
	c.Lock()
}

func n() {
	c.Lock()
	b.Lock()
}
```

### example2
[gpt]
以下是一个可能导致死锁的Golang代码示例：

```go
package main

import (
    "fmt"
    "sync"
)

func main() {
    var mu sync.Mutex
    c1 := make(chan int)

    go func() {
        mu.Lock()
        defer mu.Unlock()
        c1 <- 1
    }()

    <-c1
    mu.Lock() // 这里会导致死锁
    defer mu.Unlock()

    fmt.Println("Done")
}
```

在这个例子中，我们创建了一个互斥锁（Mutex）`mu` 和一个整数类型的无缓冲通道`c1`。接下来，我们在一个goroutine中获取了`mu`的锁，并在获取锁之后往`c1`通道中发送了一个整数1。在主goroutine中，我们从`c1`通道中接收1，然后再次试图获取`mu`的锁。但是，由于在此之前该锁已经在另一个goroutine中被获取并没有释放，因此会导致主goroutine被阻塞，从而导致死锁。

解决这个问题的方法是在goroutine中释放锁，然后在主goroutine中再获取锁，如下所示：

```go
package main

import (
    "fmt"
    "sync"
)

func main() {
    var mu sync.Mutex
    c1 := make(chan int)

    go func() {
        mu.Lock()
        defer mu.Unlock()
        c1 <- 1
    }()

    <-c1
    mu.Unlock() // 在goroutine中释放锁
    mu.Lock()   // 在主goroutine中再次获取锁
    defer mu.Unlock()

    fmt.Println("Done")
}
```

这个例子中，我们在goroutine中释放了锁，然后在主goroutine中再次获取锁，从而避免了死锁。

[/gpt]


# bugs [1][2]
``` go
 func finishReq(timeout time.Duration) r ob {
   - ch := make(chan ob)
   + ch := make(chan ob, 1)
     go func() {
         result := fn()
         ch <- result // block
     }
     
     select {
         case result = <- ch:
        	 return result
         case <- time.After(timeout):
         	return nil
     }
 }
  Figure 1. A blocking bug caused by channel
```

``` go
 var group sync.WaitGroup
 group.Add(len(pm.plugins))
     for _, p := range pm.plugins {
     go func(p *plugin) {
     	defer group.Done()
     }
-    group.Wait()
 }
 + group.Wait()

  Figure 5. A blocking bug caused by WaitGroup.
```


# 参考
1. 《15 辅导 + 案例分析 + 答疑-更多课程》  体系课_Go高级工程师实战营(完结) 
2. [Understanding Real-World Concurrency Bugs in Go](https://cseweb.ucsd.edu/~yiying/GoStudy-ASPLOS19.pdf) 
100. [规避 Go 中的常见并发 bug](https://zhuanlan.zhihu.com/p/400948709) 未
101. [理解真实项目中的 Go 并发 Bug](https://cloud.tencent.com/developer/article/2211893) 未

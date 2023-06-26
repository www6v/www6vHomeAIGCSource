---
title: Golang内置类型-Channel
date: 2022-06-26 10:01:07
tags:
  - Golang
categories:
  - Golang  
  - 内置类型
---

<p></p>
<!-- more -->

## 目录
<!-- toc -->

## 实现 [1]
``` go
type hchan struct {
   qcount   uint           // total data in the queue
   dataqsiz uint           // size of the circular queue
   buf      unsafe.Pointer // points to an array of dataqsiz elements
   elemsize uint16
   closed   uint32
   elemtype *_type // element type
   sendx    uint   // send index
   recvx    uint   // receive index
   recvq    waitq  // list of recv waiters
   sendq    waitq  // list of send waiters

   // lock protects all fields in hchan, as well as several
   // fields in sudogs blocked on this channel.
   //
   // Do not change another G's status while holding this lock
   // (in particular, do not ready a G), as this can deadlock
   // with stack shrinking.
   lock mutex
}
type waitq struct {
    first *sudog
    last  *sudog
}
```

## 使用

#####  buffer channel vs. 非buffered channel  
|    /     |       无缓冲       |        有缓冲         |
| :------: | :----------------: | :-------------------: |
| 创建方式 |  make(chan TYPE)   | make(chan TYPE, SIZE) |
| 发送阻塞 | 数据接收前发送阻塞 |   缓冲满时发送阻塞    |
| 接收阻塞 | 数据发送前接收阻塞 |   缓冲空时接收阻塞    |

[3.Go channel有无缓冲的区别？](https://www.golangroadmap.com/class/gointerview/4-3.html)  
 
##### channel的读写
  + 向关闭的channel中写入数据会panic
  + 关闭的channel中读数据
    有数据会读到数据，没数据会是nil  
    
##### Channel closing principle
[gpt] 
prompt: Golang的 Channel closing principle是什么？

在Golang中，关闭一个Channel是一种重要的操作，如果不正确地关闭Channel，可能会导致程序出现死锁或其他问题。下面是Golang中Channel关闭的原则和细则：

1. 只有发送方才能关闭Channel。
发送方是指向Channel发送数据的goroutine，而接收方是指从Channel接收数据的goroutine。在Golang中，只有发送方才能关闭Channel，因为发送方知道何时不再需要发送数据，从而触发关闭Channel的操作。

2. 关闭Channel后，接收方仍然可以接收Channel中的数据。
当一个Channel被关闭后，接收方仍然可以从Channel中接收已经存在的数据，直到Channel中的所有数据都被接收完毕。这使得接收方可以在不知道Channel何时被关闭的情况下，安全地从Channel中接收数据。

3. 关闭一个已经关闭的Channel会导致panic。
如果尝试关闭一个已经关闭的Channel，会导致panic，因此在关闭Channel之前，应该先检查Channel是否已经关闭。

4. 关闭一个nil的Channel会导致panic。
如果尝试关闭一个nil的Channel，也会导致panic，因此在关闭Channel之前，应该先检查Channel是否为nil。

5. 关闭一个有缓冲的Channel时，仍然可以向其中发送数据。
当一个有缓冲的Channel被关闭时，发送方仍然可以向其中发送数据，直到Channel被填满。因此，在关闭一个有缓冲的Channel之后，可能还有一些数据需要被发送。

6. 关闭一个Channel会使Channel上的所有阻塞操作立即解除阻塞并返回。
当一个Channel被关闭时，Channel上的所有阻塞操作（包括接收和发送操作）都会立即解除阻塞并返回。对于接收操作，返回的值为Channel中剩余的数据，如果Channel已经为空，则返回类型的零值。对于发送操作，返回的结果通常为false，表示数据没有被发送成功。

总之，关闭Channel是一项重要的操作，需要遵循一些原则和细则来保证程序的正确性和稳定性。在使用Channel的过程中，应该注意遵循这些原则和细则。
[/gpt]


## 参考
1. [golang channel原理 ](https://www.cnblogs.com/haiyux/p/15161495.html) *** 
2. 《09 神奇的内置数据结构》  channel 看动画 *** 
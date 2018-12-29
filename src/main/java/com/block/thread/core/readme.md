《java多线程编程核心技术》学习笔记
Thread.isAlive()判断线程是否活跃状态，活跃状态是指线程处于正在运行或准备开始运行的状态
停止线程3中方法：
1：正常停止，run方法运行完毕，线程退出终止
2：调用stop()方法或suspend或resume，不建议，因为这些方法会强制退出线程，导致数据丢失，高版本jdk已废弃这些方法
3:调用interrupt方法中断线程，推荐使用

synchronize：如果线程调用对象的synchronize方法，那么其他线程需要等到锁释放，但是其他线程可以访问该对象的其他非synchronize方法，但不可以方位该对象的
其他synchronize方法，这也说明了synchronize锁是针对对象的。
synchronized拥有锁重入功能，也就是在使用synchronize时，当一个线程得到一个对象锁后，再次请求该对象的其他synchronize方法/块时，是永远可以得到锁的，
并不需要等待释放，如果需要等待释放，就会造成死锁（不可重入锁），这种关系也支持在父子类继承的环境中
synchronized同步方法里面的块：一个线程执行一个方法时，遇到synchronized块，拿到锁，其他线程可以进入这个方法，执行到synchronized块时
也是需要等待，这可以解决效率问题，如果一个方法有有一段代码需要执行很长时间，但是这段代码不会出现线程安全问题，只有一小段会出现线程安全问题，那么可以只
在这一小段上加入同步synchronized（this）{}关键字，只有执行这一小段需要等到锁，其他的不需要
synchronized静态方法锁的是字节文件xxx.class，与对象实例的锁是不一样的，在静态方法里面同步块也是这样。class锁会对这个类的所有实例起作用

volatile关键字：
使变量在多线程间可见，见demo VolatileDemo
volatile并不能保证原子性，比如i++,执行这一操作，会分为三步走，从主线程中load i的值到线程内存中,计算i+1,将结果赋值给i，在将i写到主内存，volatile只会保证每次执行都从主内存中把i的值load回来，后面的操作并不同步，如果在执行后面的i+1和赋值时，其他线程改变了主内存i的值，方法区执行的线程并不知道i被修改，最后还会吧i写到主内存，造成数据不一致，见AtomicDemo
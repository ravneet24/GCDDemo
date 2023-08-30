//
//  ViewController.swift
//  Concurrency
//
//  Created by Ravneet Arora on 25/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// It is not possible to run sync task on the queue which is already owned by the  thread running on same queue
        
        // ********* deadlock -- App crash ************************
        //        DispatchQueue.main.sync {
        //            print("I am inside synchronus block in main queue")
        //        }
        //  *********************************
        
        // ********* deadlock -- App crash ************************
        //                let customQueue = DispatchQueue(label: "customQueue")
        //                customQueue.async {
        //                    print("I am inside async block in queue")
        //                    customQueue.sync {
        //                        print("I am inside sync block inside queue")
        //                    }
        //                    print("after and outside sync block")
        //
        //                }
        //                print("I am outside Queue")
        
        //        ******************  working ***************
        //        let anotherCustomQueue = DispatchQueue(label: "another custom queue")
        //        anotherCustomQueue.sync {
        //            print("I am inside synchronus block in custom queue")
        //        }
        //        print("After sync block outside another custom queue")
        
        //        *************** working *****************
        //        let anotherCustomQueue = DispatchQueue(label: "another custom queue")
        //        anotherCustomQueue.sync {
        //            anotherCustomQueue.async {
        //                print("I am inside asynchronus block in custom queue in outer sync block")
        //            }
        //            print("I am inside synchronus block in custom queue")
        //        }
        //        print("After sync block outside another custom queue")
        
        //        *************** two tasks submitted on serial queue and run synchronusly in serial queue -- working  *****************
//        let customSerialQueue = DispatchQueue(label: "custom serial queue")
//        customSerialQueue.async {
//            for i in 0...10 {
//                print("first task ---> \(i)")
//            }
//        }
//        customSerialQueue.async {
//            for i in 0...10 {
//                print("second task ---> \(i)")
//            }
//        }
        
        //        *************** we are running two tasks on concurrent queue here. Also we are not blocking main thread. -- working *****************
//        let customConcurrentQueue = DispatchQueue(label: "custom serial queue", attributes: [.concurrent])
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("first task ---> \(i)")
//            }
//        }
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("second task ---> \(i)")
//            }
//        }
//        print("outside concurrent queue and After two tasks submitted in concurrent queue")
   
        //        *************** created foru serial queues and run tasks asynchronusly in four queues. we can also execute parallely like this. -- working  *****************
        
//        let customSerialQueue1 = DispatchQueue(label: "custom serial queue 1")
//        customSerialQueue1.async {
//            print("Task in customSerialQueue1")
//        }
//        let customSerialQueue2 = DispatchQueue(label: "custom serial queue 2")
//        customSerialQueue2.async {
//            print("Task in customSerialQueue2")
//        }
//        let customSerialQueue3 = DispatchQueue(label: "custom serial queue 3")
//        customSerialQueue3.async {
//            print("Task in customSerialQueue3")
//        }
//        let customSerialQueue4 = DispatchQueue(label: "custom serial queue 4")
//        customSerialQueue4.async {
//            print("Task in customSerialQueue4")
//        }
        
        //        *************** created 4 concurrent queues and exectong one task in each queue synchronusly -- working  *****************
        
//        let customConcurrentQueue1 = DispatchQueue(label: "custom concurrent queue 1", attributes: [.concurrent])
//        customConcurrentQueue1.sync {
//            print("Task in customConcurrentQueue1")
//        }
//        let customConcurrentQueue2 = DispatchQueue(label: "custom concurrent queue 2", attributes: [.concurrent])
//        customConcurrentQueue2.sync {
//            print("Task in customConcurrentQueue2")
//        }
//        let customConcurrentQueue3 = DispatchQueue(label: "custom concurrent queue 3", attributes: [.concurrent])
//        customConcurrentQueue3.sync {
//            print("Task in customConcurrentQueue3")
//        }
//        let customConcurrentQueue4 = DispatchQueue(label: "custom concurrent queue 4", attributes: [.concurrent])
//        customConcurrentQueue4.sync {
//            print("Task in customConcurrentQueue4")
//        }
        
        //        *************** created 4 concurrent queues and exectong one task in each queue asynchronusly -- working  *****************
        
//        let customConcurrentQueue1 = DispatchQueue(label: "custom concurrent queue 1", attributes: [.concurrent])
//        customConcurrentQueue1.async {
//            print("Task in customConcurrentQueue1")
//        }
//        print("outside customConcurrentQueue1")
//        let customConcurrentQueue2 = DispatchQueue(label: "custom concurrent queue 2", attributes: [.concurrent])
//        customConcurrentQueue2.async {
//            print("Task in customConcurrentQueue2")
//        }
//        print("outside customConcurrentQueue2")
//        let customConcurrentQueue3 = DispatchQueue(label: "custom concurrent queue 3", attributes: [.concurrent])
//        customConcurrentQueue3.async {
//            print("Task in customConcurrentQueue3")
//        }
//        print("outside customConcurrentQueue3")
//        let customConcurrentQueue4 = DispatchQueue(label: "custom concurrent queue 4", attributes: [.concurrent])
//        customConcurrentQueue4.async {
//            print("Task in customConcurrentQueue4")
//        }
//        print("outside customConcurrentQueue4")
//
        //        *************** dipathc work item to store tasks and run later or cancel -- working  *****************
        
//        let dispatchWorkItem = DispatchWorkItem {
//            print("Task stored in dispatchWorkItem")
//        }
//
//        let customSerialQueue = DispatchQueue(label: "custom serial queue")
//
//        //Task 1
//        customSerialQueue.async(execute: dispatchWorkItem)
//      // run synchronusly if you need to run task 1 mandatory
//      //  customSerialQueue.sync(execute: dispatchWorkItem)
//
//        // Task 2
//        customSerialQueue.asyncAfter(deadline: DispatchTime.now() + 2, execute: dispatchWorkItem)
//
//        //cancel  work item
//        dispatchWorkItem.cancel()
//
//        // Task 3
//        customSerialQueue.async(execute: dispatchWorkItem)
//
//        if dispatchWorkItem.isCancelled {
//            print("item cancelled")
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        //        *************** Dispatch group -- thread will block if we will not balance enter and leave functions. --- if main thread will block, watchdog can kill app too *****************
//
//        let customConcurrentQueue = DispatchQueue(label: "custom concurrent queue", attributes: [.concurrent])
//
//        let dispatchGroup = DispatchGroup()
//        dispatchGroup.enter()
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 1 in customConcurrentQueue ---> \(i)")
//            }
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 2 in customConcurrentQueue ---> \(i)")
//            }
//            dispatchGroup.leave()
//        }
//
//        print("Inside group before wait")
//        dispatchGroup.wait()
//        print("outside group , tasks executed properly")
        
        //        *************** Dispatch group -- if we comment one leave function here then we block background thread not main thread. we can check by tapping on button here" -- working  *****************
        
//        let customConcurrentQueue = DispatchQueue(label: "custom concurrent queue", attributes: [.concurrent])
//
//        let dispatchGroup = DispatchGroup()
//        dispatchGroup.enter()
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 1 in customConcurrentQueue ---> \(i)")
//            }
//      //      dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 2 in customConcurrentQueue ---> \(i)")
//            }
//            dispatchGroup.leave()
//        }
//
//        customConcurrentQueue.async {
//            dispatchGroup.wait()
//            print("after wait function in async block")
//        }
//
//        print("back on main thread")
        
        /// ********** Dispatch group notify method ********************
//        let customConcurrentQueue = DispatchQueue(label: "customConcurrentQueue", attributes: [.concurrent])
//
//        let dispatchGroup = DispatchGroup()
//
//        customConcurrentQueue.async(group: dispatchGroup) {
//            for i in 0...10 {
//                print("Tak 1 ---> \(i)")
//            }
//        }
//
//        customConcurrentQueue.async(group: dispatchGroup) {
//            for i in 0...10 {
//                print("Task 2 ---> \(i)")
//            }
//            sleep(5)
//        }
//
//        dispatchGroup.notify(queue: customConcurrentQueue) {
//            print("both tasks are completed")
//        }
        
//        /// ********** Dispatch Barrier ********************
//
//        let customConcurrentQueue = DispatchQueue(label: "customConcurrentQueue", attributes: [.concurrent])
//
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 1 ---> \(i)")
//            }
//        }
//
//        customConcurrentQueue.async {
//            for i in 0...10 {
//                print("Task 2 ---> \(i)")
//            }
//        }
//
//        customConcurrentQueue.async(flags: .barrier) {
//            for i in 0...10 {
//                print("Task 3 ---> \(i)")
//            }
//        }
//
//        customConcurrentQueue.async {
//            print("Task 4")
//        }
//        print("Running on main thread and outside concurrent queue")
        
        // -------- Problem ----------
        // ----------1--------------
//        DispatchQueue.main.async {
//            for i in 0...3 {
//                print("Task 1 in main queue ---> \(i)")
//            }
//        }
//
//        for i in 0...3 {
//            print("Task not in queue ---> \(i)")
//        }
//
//        DispatchQueue.main.async {
//            for i in 0...3 {
//                print("Task 2 in main queue---> \(i)")
//            }
//        }
        // ----------2--------------
//        DispatchQueue.global(qos: .userInteractive).async {
//            print("Thread in userInteractive ----> \(Thread.isMainThread)")
//        }
       //----------3--------------
//        DispatchQueue.global(qos: .background).async {
//            for i in 0...10 {
//                print("Task with background QOS ---> \(i)")
//            }
//
//        }
//        DispatchQueue.global(qos: .userInteractive).async {
//            for i in 0...10 {
//                print("Task with userInteractive QOS ---> \(i)")
//            }
//
//        }
        
        //------------- serial queue with async dispatch  -----------
//        let customSerialQueue = DispatchQueue(label: "customSerialQueue")
//        for i in 0..<3 {
//        customSerialQueue.async {
//                if Thread.isMainThread {
//                    print("running on main thread")
//                } else {
//                    print("running on other thread")
//                }
//                print("Task \(i) inside loop")
//            }
//        }
//        customSerialQueue.async {
//            for i in 3..<5 {
//                if Thread.isMainThread {
//                    print("running on main thread")
//                } else {
//                    print("running on other thread")
//                }
//                print("Task \(i) outside loop")
//            }
//        }
//        print("outside queue")
        
//        //-------------  serail queue with one sync dispatch In sync block This may or may not  work on main thread depends upon whether main thread is idle or not --- exceptional case -----------
//        let customSerialQueue = DispatchQueue(label: "customSerialQueue")
//        for i in 0..<3 {
//        customSerialQueue.sync {
//                if Thread.isMainThread {
//                    print("running on main thread")
//                } else {
//                    print("running on other thread")
//                }
//                print("Task \(i) inside loop")
//            }
//        }
//        customSerialQueue.async {
//            for i in 3..<5 {
//                if Thread.isMainThread {
//                    print("running on main thread")
//                } else {
//                    print("running on other thread")
//                }
//                print("Task \(i) outside loop")
//            }
//        }
//        print("outside queue")
        
//        //------------- concurrent queue with async dispatch  -----------
//
//        let customConcurrentQueue = DispatchQueue(label: "customConcurrentQueue", attributes: [.concurrent])
//                for i in 0..<3 {
//                    customConcurrentQueue.async {
//                        if Thread.isMainThread {
//                            print("running on main thread")
//                        } else {
//                            print("running on other thread")
//                        }
//                        print("Task \(i) inside loop")
//                    }
//                }
//                  customConcurrentQueue.async {
//                    for i in 3..<5 {
//                        if Thread.isMainThread {
//                            print("running on main thread")
//                        } else {
//                            print("running on other thread")
//                        }
//                        print("Task \(i) outside loop")
//                    }
//                }
//                print("outside queue")
        
        //------------- concurrent queue with async dispatch  -----------
        
//        let customConcurrentQueue = DispatchQueue(label: "customConcurrentQueue", attributes: [.concurrent])
//                for i in 0..<3 {
//                    customConcurrentQueue.sync {
//                        if Thread.isMainThread {
//                            print("running on main thread")
//                        } else {
//                            print("running on other thread")
//                        }
//                        print("Task \(i) inside loop")
//                    }
//                }
//                  customConcurrentQueue.async {
//                    for i in 3..<5 {
//                        if Thread.isMainThread {
//                            print("running on main thread")
//                        } else {
//                            print("running on other thread")
//                        }
//                        print("Task \(i) outside loop")
//                    }
//                }
//                print("outside queue")
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        print("button tapped")
    }
    
    @IBAction func pushToSecondVC(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


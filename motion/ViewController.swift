//
//  ViewController.swift
//  motion
//
//  Created by みなじゅん on 2017/08/30.
//  Copyright © 2017年 みなじゅん. All rights reserved.
//

//
//  ViewController.swift
//  MotionTest
//
//  Created by みなじゅん on 2017/08/30.
//  Copyright © 2017年 みなじゅん. All rights reserved.
//

import UIKit
import CoreMotion

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // create instance of MotionManager
    let motionManager: CMMotionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize MotionManager
        motionManager.deviceMotionUpdateInterval = 0.05 // 20Hz
        
        // Start motion data acquisition
        motionManager.startDeviceMotionUpdates( to: OperationQueue.current!, withHandler:{
            deviceManager, error in
            
            let attitude: CMAttitude = deviceManager!.attitude
            let roll = Int(attitude.roll * 180.0 / M_PI)
            let pitch = Int(attitude.pitch * 180.0 / M_PI)
            let yaw = Int(attitude.yaw * 180.0 / M_PI)
            print("roll: \(roll) pitch: \(pitch) yaw:\(yaw)")
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

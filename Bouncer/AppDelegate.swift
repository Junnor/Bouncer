//
//  AppDelegate.swift
//  Bouncer
//
//  Created by Junor on 16/3/30.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    struct Motion {
        static let Manager = CMMotionManager()
    }

}


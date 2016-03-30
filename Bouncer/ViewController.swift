//
//  ViewController.swift
//  Bouncer
//
//  Created by Junor on 16/3/30.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    
    let bouncer = BouncerBehavior()
    
    lazy var animator: UIDynamicAnimator = { return UIDynamicAnimator(referenceView: self.gameView) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bouncer)
    }
    
    struct Constants {
        static let BlockSize = CGSize(width: 40, height: 40)
    }
    
    var redBlock: UIView?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if redBlock == nil {
            redBlock = addBlock()
            redBlock?.backgroundColor = UIColor.redColor()
            bouncer.addBlock(redBlock!)
        }
        
        let motionManager = AppDelegate.Motion.Manager
        if motionManager.accelerometerAvailable {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) in
                self.bouncer.gravity.gravityDirection = CGVector(dx: (data?.acceleration.x)!, dy: -(data?.acceleration.y)!)
            }
        }
    }
    
    func addBlock() -> UIView {
        let block = UIView(frame: CGRect(origin: CGPoint.zero, size: Constants.BlockSize))
        block.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.midY)
        return block
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        AppDelegate.Motion.Manager.stopAccelerometerUpdates()
    }

}


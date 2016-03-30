//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Junor on 16/3/30.
//  Copyright © 2016年 Junor. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    private lazy var collider: UICollisionBehavior = {
        let lazillyCreatedCollider = UICollisionBehavior()
        lazillyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazillyCreatedCollider
    }()
    
    private lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazillyBlockBehavior = UIDynamicItemBehavior()
        lazillyBlockBehavior.allowsRotation = false
        lazillyBlockBehavior.elasticity = 0.85
        lazillyBlockBehavior.friction = 0
        lazillyBlockBehavior.resistance = 0
        return lazillyBlockBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }

}

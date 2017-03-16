//
//  thirdAttemptViewController.swift
//  UIKitDynamics
//
//  Created by Sierra 4 on 16/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class thirdAttemptViewController: UIViewController {
    @IBOutlet weak var viewReference: UIView!
    
    
    
    var squareView: UIView!
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.viewReference)
    }()
    
    lazy var gravity:UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    lazy var collider:UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        // This line, makes the boundries of our reference view a boundary
        // for the added items to collide with.
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
    }()
    
    func animateSquare(){
        // 1. Add behaviors to the animator
        animator.addBehavior(gravity)
        
        // 2. Add items to the behavior
        gravity.addItem(squareView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawSquare()
        animateSquare()
        
    }
    func drawSquare(){
        let squareSize = CGSize(width: 30.0, height: 30.0)
        let centerPoint = CGPoint(x: self.viewReference.bounds.midX - (squareSize.width/2), y: 0/*self.viewReference.bounds.midY - (squareSize.height/2)*/)
        let frame = CGRect(origin: centerPoint, size: squareSize)
        squareView = UIView(frame: frame)
        squareView.backgroundColor = UIColor.orange
        
        viewReference.addSubview(squareView)
    }
}

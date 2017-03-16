//
//  CodedViewController.swift
//  UIKitDynamics
//
//  Created by Sierra 4 on 16/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class CodedViewController: UIViewController, UICollisionBehaviorDelegate {
    
    // a dynamic animator adds all of the animations for the view on which we are 
    // going to add the physics related behaviour
    // dynamic animator - driver for all the animations
    var animator: UIDynamicAnimator?
    // below 2 are the UIDynamic behaviours
    var gravity: UIGravityBehavior?
    var collision: UICollisionBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collision?.collisionDelegate = self
        // Do any additional setup after loading the view.
        let square = UIView(frame: CGRect(x:100, y:100, width:100, height: 100))
        square.backgroundColor = UIColor.blue
        view.addSubview(square)
        
        // adding a barrier to stop the falling square view
        let barrier = UIView(frame: CGRect(x: 0, y: 250, width: 140, height: 20))
        barrier.backgroundColor = UIColor.darkGray
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator?.addBehavior(gravity!)
        
        collision = UICollisionBehavior(items: [square])
        collision?.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        // below utilises the bounds from the UIDynamicsAnimator where
        // we have used the reference view as our superview
        collision?.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision!)
        
        
//        collision?.action = {
//            print("\(NSStringFromCGAffineTransform(square.transform)) \(NSStringFromCGPoint(square.center))")
//        }

    }
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        print ("Contact - \(identifier)")
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
                print("Boundary contact occurred : \(identifier)")
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellow
        UIView.animate(withDuration: 0.3) {
            collidingView.backgroundColor = UIColor.gray
        }
            }
}
//extension CodedViewController: UICollisionBehaviorDelegate {
//    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
//        print("Boundary contact occurred : \(identifier)")
//    }
//}

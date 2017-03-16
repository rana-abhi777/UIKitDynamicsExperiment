//
//  ViewController.swift
//  UIKitDynamics
//
//  Created by Sierra 4 on 09/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewSquare: UIView!
    @IBOutlet weak var viewBarrier: UIView!
    
    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var collision: UICollisionBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator = UIDynamicAnimator(referenceView: view)
        collision?.collisionDelegate = self
        
    }
    @IBAction func btnStartClick(_ sender: Any) {
        
        gravity = UIGravityBehavior(items: [viewSquare])
        animator?.addBehavior(gravity!)
        
        collision = UICollisionBehavior(items: [viewSquare])
        collision?.addBoundary(withIdentifier: "viewBarrier" as NSCopying, for: UIBezierPath(rect: viewBarrier.frame))
        
        collision?.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision!)
        
        
    }
}
extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("Boundary contact occurred : \(identifier)")
    }
}


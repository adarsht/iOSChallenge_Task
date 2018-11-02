//
//  ViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 30/10/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        self.navigationController?.hidesBarsOnSwipe = true
//        title = "James iOSChallengeTask"
//        self.tabBarController?.hidesBottomBarWhenPushed = true
//        hidesBottomBarWhenPushed = true
//        self.tabBarController?.hidesBarsOnSwipe = true
        // Do any additional setup after loading the view, typically from a nib.
    }


    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        let duration:TimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animate(withDuration: duration) {
                self.tabBarController?.tabBar.frame = (frame?.offsetBy(dx: 0, dy: offsetY!))!//CGRect.offsetBy(dx:0, dy:offsetY!)
                return
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return (self.tabBarController?.tabBar.frame.origin.y)! < self.view.frame.maxY
    }
    
    // Call the function from tap gesture recognizer added to your view (or button)
    
    @IBAction func tapped(sender: AnyObject) {
        setTabBarVisible(visible: !tabBarIsVisible(), animated: true)
    }
    
    @IBAction func ontapped(_ sender: UIButton) {
        setTabBarVisible(visible: !tabBarIsVisible(), animated: true)
    }
    
}


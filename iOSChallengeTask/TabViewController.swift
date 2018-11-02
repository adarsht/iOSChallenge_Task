//
//  TabViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 01/11/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var i = Int(0)
        for viewController in self.viewControllers! {
            print(i)
            
            if viewController is QRViewController {
                print("!!!!!!!!!!",i)
                let img = UIImage(named: "qr")
                img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                viewController.tabBarItem = UITabBarItem(title: "Hello world!", image: img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 0)
                viewController.tabBarItem.imageInsets.top = -30
                //do something if it's an instance of that class
            }
            i = i + 1
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

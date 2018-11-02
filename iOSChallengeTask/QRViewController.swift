//
//  QRViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 01/11/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarItem = UITabBarItem(title: "QR", image: #imageLiteral(resourceName: "routineIcon").withRenderingMode(.alwaysOriginal), tag: 0)
        let img = UIImage(named: "qr")
        img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.tabBarItem = UITabBarItem(title: "Hello world!", image: img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), tag: 0)
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

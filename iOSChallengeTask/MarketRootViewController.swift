//
//  MarketRootViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 31/10/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit

class MarketRootViewController: UIViewController {
    
    @IBOutlet weak var mBtn_Search: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        mBtn_Search.imageView?.contentMode = .scaleAspectFit
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        let lbNavTitle = UILabel (frame: CGRect(x: 0, y: 40, width: 320, height: 40))
        lbNavTitle.center = CGPoint(x: 160, y: 285)
        lbNavTitle.font = UIFont.init(name: "HelveticaNeue-bold", size: 30)
        lbNavTitle.textAlignment = .left
        lbNavTitle.text = "Market"
        self.navigationItem.titleView = lbNavTitle
        
        
        
        
     
        
    }
}

//
//  ChildExampleViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 31/10/18.
//  Copyright © 2018 Osiya. All rights reserved.
//
import Foundation
import XLPagerTabStrip

class ChildExampleViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "View"
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        navigationController?.isNavigationBarHidden = false;
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = itemInfo.title
        
        view.addSubview(label)
        view.backgroundColor = .white
        
        view.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -50))
        
        
//        let le = UIImageView(frame: view.bounds)
//        view.addSubview(le)
//        le.image = UIImage(named: "Currency_Solutions.png")
        
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    override func viewDidAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = false;
//        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

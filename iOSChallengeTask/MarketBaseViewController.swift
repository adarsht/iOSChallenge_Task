//
//  MarketBaseViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 31/10/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MarketBaseViewController: ButtonBarPagerTabStripViewController {
    @IBOutlet weak var shadowView: UIView!
    let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)
    lazy var bigLabel: UILabel = {
        let bigLabel = UILabel()
        bigLabel.backgroundColor = .red
        bigLabel.textColor = .white
        bigLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bigLabel.adjustsFontSizeToFitWidth = true
        return bigLabel
    }()
    
    override func viewDidLoad() {
        
        if navigationController != nil {
            navigationItem.titleView = bigLabel
            bigLabel.sizeToFit()
        }
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .clear
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 16)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .red
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        //        settings.style.buttonBarItemFont =
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightGray
            oldCell?.selectBar.backgroundColor = .white
            newCell?.label.textColor = .white
            newCell?.selectBar.backgroundColor = .black
//            newCell?.contentView.layer.cornerRadius
        }
        print("hello")
        super.viewDidLoad()
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //        let child_1 = TableChildExampleViewController(style: .plain, itemInfo: "FOLLOWING")
        let child_1 = MoneyViewController(itemInfo: "Money Transfer")
        let child_2 = ChildExampleViewController(itemInfo: "Insurance")
        let child_3 = ChildExampleViewController(itemInfo: "Credit")
        let child_4 = ChildExampleViewController(itemInfo: "Loan")
        return [child_1, child_2, child_3, child_4]
    }
    
    // MARK: - Custom Action
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

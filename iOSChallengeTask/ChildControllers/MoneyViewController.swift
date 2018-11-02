//
//  MoneyViewController.swift
//  iOSChallengeTask
//
//  Created by baps on 31/10/18.
//  Copyright © 2018 Osiya. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MoneyViewController: UIViewController, IndicatorInfoProvider,UITableViewDelegate, UITableViewDataSource {
    
    var itemInfo: IndicatorInfo = "View"
    var tableView: UITableView!
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rect = view.bounds
        rect.size.height = rect.size.height - 60
        tableView = UITableView(frame: rect)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
//        let market = DetailsXIBView(frame: view.bounds)
        view.addSubview(tableView)
        
        
        let btn = UIButton(frame: CGRect(x: 30, y: view.frame.height - 250, width: view.frame.width - 60, height: 40))
        btn.setTitle("Compare Money Transfer", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 20
        btn.titleLabel?.font =  UIFont(name: "SFCompactText-Medium", size: 22)
        view.addSubview(btn)
        //SFCompactText-Medium
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        print(targetContentOffset)
//        print(scrollView)
//        print(velocity)
        if velocity.y < 0 {
            navigationController?.setNavigationBarHidden(false, animated: true)
            self.tabBarController?.setTabBarVisible(visible: true, animated: true)
//            self.tabBarController?.tabBar.isHidden = false
            
        }else{
            navigationController?.setNavigationBarHidden(true, animated: true)
            self.tabBarController?.setTabBarVisible(visible: false, animated: true)
            
//            self.tabBarController?.tabBar.isHidden = true
        }
    }
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
    }
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    let img:[String] = ["Currency_Solutions.png","Currency_Fair.png","XendPay.png","Transferwise.png"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.width * 1.15)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "SimpleCell"
        var cell:SimpleCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SimpleCell
        if (cell == nil)
        {
            var nib:Array = Bundle.main.loadNibNamed("SimpleCell", owner: self, options: nil)!
            cell = nib[0] as? SimpleCell
        }
        cell!.imgView.image = UIImage(named: img[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
    
    
}
extension UITabBarController {
    
    private struct AssociatedKeys {
        // Declare a global var to produce a unique address as the assoc object handle
        static var orgFrameView:     UInt8 = 0
        static var movedFrameView:   UInt8 = 1
    }
    
    var orgFrameView:CGRect? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.orgFrameView) as? CGRect }
        set { objc_setAssociatedObject(self, &AssociatedKeys.orgFrameView, newValue, .OBJC_ASSOCIATION_COPY) }
    }
    
    var movedFrameView:CGRect? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.movedFrameView) as? CGRect }
        set { objc_setAssociatedObject(self, &AssociatedKeys.movedFrameView, newValue, .OBJC_ASSOCIATION_COPY) }
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let movedFrameView = movedFrameView {
            view.frame = movedFrameView
        }
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        //since iOS11 we have to set the background colour to the bar color it seams the navbar seams to get smaller during animation; this visually hides the top empty space...
        view.backgroundColor =  self.tabBar.barTintColor
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        //we should show it
        if visible {
            tabBar.isHidden = false
            UIView.animate(withDuration: animated ? 0.3 : 0.0) {
                //restore form or frames
                self.view.frame = self.orgFrameView!
                //errase the stored locations so that...
                self.orgFrameView = nil
                self.movedFrameView = nil
                //...the layoutIfNeeded() does not move them again!
                self.view.layoutIfNeeded()
            }
        }
            //we should hide it
        else {
            //safe org positions
            orgFrameView   = view.frame
            // get a frame calculation ready
            let offsetY = self.tabBar.frame.size.height
            
            print(orgFrameView)
            movedFrameView = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + offsetY+100)
            print(movedFrameView)
            //animate
            
            movedFrameView   = view.frame
            
            
            UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
                self.view.frame = self.movedFrameView!
                self.view.layoutIfNeeded()
            }) {
                (_) in
                self.tabBar.isHidden = true
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return orgFrameView == nil
    }
}

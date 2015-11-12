//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit

class LmNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    override class func initialize(){
    
    
        let  navBar = UINavigationBar.appearance()
        
        
        navBar.barTintColor = UIColor.yellowColor()
        
        
        
        
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(15),NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        navBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: .Default)
        
        
        
        let navItem = UIBarButtonItem.appearance()
        
        
        navItem.tintColor = UIColor.whiteColor()
        
        navBar.tintColor = UIColor.whiteColor()
        
        navItem.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: .Default)
        
        
        
        
        
        //  当没有设置导航栏背景图片时，控制器的View的原点从（0，0）开始，不会自动向下移动 64 ，当设置背景图片时，控制器view的原点从导航栏正下方开始 即（64，0） =  （0，0）
        
        
        
    
    
    }
    
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        
        if self.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
        
    }
    
   
}

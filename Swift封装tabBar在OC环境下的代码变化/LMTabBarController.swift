//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit

class LMTabBarController: UITabBarController,LMTabBarViewDelegate {

    var tabBarView:LMTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.redColor()
        
        
        self.tabBar.tintColor = UIColor.orangeColor() //  tabbar 的字体颜色
        
        
        
        self.setupTabBarView()
        
        self.setupChildVC()
        
            }
    
    
    
    func setupChildVC(){
    
        let  one = OneController()
        let two = TwoController()
        let three = ThreeController()
        let four = FourController()
        one.tabBarItem.badgeValue = "122"
        self.addChildVCWith(one, VcTitle: "第一控制器", nomlImageName: "tabbar_profile", selectedImageName: "tabbar_profile_selected")
        
        self.addChildVCWith(two, VcTitle: "第2控制器", nomlImageName: "tabbar_profile", selectedImageName: "tabbar_profile_selected")
        self.addChildVCWith(three, VcTitle: "第3控制器", nomlImageName: "tabbar_profile", selectedImageName: "tabbar_profile_selected")
        self.addChildVCWith(four, VcTitle: "第4控制器", nomlImageName: "tabbar_profile", selectedImageName: "tabbar_profile_selected")
    
    }
    
    func setupTabBarView(){
    
        
        let tabBarView = LMTabBarView.init(frame: self.tabBar.bounds)
    
        self.tabBarView = tabBarView
        tabBarView.delegate = self
//        self.tabBarView.backgroundColor = UIColor.greenColor()
        self.tabBar.addSubview(tabBarView)
        
    
    }
    
    
    func tabBarViewClickButtonToChangeVc(sender: LMTabBarView, formVc: Int, toVc: Int) {
        
        
        
        self.selectedIndex = toVc
        
        print("\(formVc)-----\(toVc)")
        
        
        
        
    }
    
    
    
    func addChildVCWith(Vc:UIViewController,VcTitle: String , nomlImageName:String,selectedImageName:String){
    
    
        Vc.title = VcTitle
        Vc.tabBarItem.image = UIImage(named: nomlImageName)
        
        
        var oImage = UIImage(named:selectedImageName )
        oImage = oImage!.imageWithRenderingMode(.AlwaysOriginal)
        
        Vc.tabBarItem.selectedImage = oImage
        
      
        
        let nav = LmNavigationController.init(rootViewController: Vc)
        
        
        
        
        
        self.addChildViewController(nav)
        
        
        self.tabBarView.addTabBarButtonWith(Vc.tabBarItem)
    
        
        
    
    
    }
    
    
    
    override  func viewWillAppear(animated: Bool) {
        
        
        
        super.viewWillAppear(animated)
        
        
        for  subView in self.tabBar.subviews {
        
            
            if subView.isKindOfClass(NSClassFromString("UITabBarButton")!){
            
                
                subView.removeFromSuperview()
                
            
            }
            
        
        
        }
        
        
        
    }

    

   
}

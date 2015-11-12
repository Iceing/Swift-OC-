//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit


@objc protocol  LMTabBarViewDelegate:NSObjectProtocol{


    optional func tabBarViewClickButtonToChangeVc(sender:LMTabBarView,formVc:Int , toVc:Int)

}






class LMTabBarView: UIView {

    
//    override init(frame: CGRect) {
//        
//        super.init(frame: frame)
//        
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        
//        
//        
//    }
//    
    
    var delegate:LMTabBarViewDelegate?
    var selectedBtn:UIButton?
    
    func addTabBarButtonWith(button:UITabBarItem){
    
        
        
        let btn = LmTabBarButton()
        
        
        btn.itemValue = button
        
     
        btn.addTarget(self, action: "btnChangeVC:", forControlEvents: .TouchDown)
        self.addSubview(btn)
        
        if self.subviews.count == 1{
        
        
            self.btnChangeVC(btn)
            
        
        }
        
        
        
        
        
        
    
    
    }
    
    
    
    func btnChangeVC(sender:UIButton){
    
    
              
        if ((self.delegate?.respondsToSelector("tabBarViewClickButtonToChangeVc:fromVc:toVc:")) != nil){
        
           
            
            let from:Int = (self.selectedBtn != nil) ? (selectedBtn?.tag)! : 0
            
            
            self.delegate!.tabBarViewClickButtonToChangeVc!(self, formVc: from, toVc: sender.tag)
            
        
        }
        
        self.selectedBtn?.selected = false
        
        sender.selected = true
        
        self.selectedBtn = sender
        
        
        
    
    
    }
    
    
    
    override func layoutSubviews() {
        
        
        
//        let button 
        super.layoutSubviews()
        
        let buttonH:CGFloat = self.frame.size.height
        let buttonY:CGFloat = 0
        let buttonW:CGFloat =  self.frame.size.width / CGFloat(self.subviews.count)
        
        for (index , button) in self.subviews.enumerate(){
            let buttonX:CGFloat = CGFloat(index) * buttonW
            
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
        
            button.tag = index
        
        }
        
        
        
        
    }
    
    
    
}

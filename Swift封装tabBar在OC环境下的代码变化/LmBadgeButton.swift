//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit

class LmBadgeButton: UIButton {

    
    
//    var badgeValue:String?{
//    
//    
//        get {
//        
//        
//            
//            return self.badgeValue
//        }
//        
//        
//        set {
//        
//        
//            self.badgeValue = newValue
//            
//            
//            
//            
//            
//        
//        }
//        
//        
//    
//    }
    
    
    
    func setBadgeValueWith(badgeValue:String){
    
        
        if let str:String = badgeValue{
        
            self.hidden = false
            
            self.setTitle(str , forState: .Normal)
            
            var  frame = self.frame
            
            let badgeH = self.currentBackgroundImage!.size.height
            
            var  badgeW = self.currentBackgroundImage!.size.width
            
            
            if str.characters.count > 1{
            
                let badgeSize = str.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(11)])
            
                
                badgeW = badgeSize.width + 10.0
                
            }
            
            frame.size.width = badgeW
            frame.size.height = badgeH
            self.frame = frame
        
            
            
        
        }else{
        
        
            self.hidden = true
            
        }
        
        
    
    
    }
    
    
    override  init(frame: CGRect) {
        
    
        super.init(frame: frame)
        
         self.setupBadge()
        
        
        
    }
    
    required  init?(coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        
        self.setupBadge()
        
        
        
    }
    
    
    func setupBadge(){
    
        
        self.userInteractionEnabled = false
        
        
        self.setBackgroundImage(self.resizableImageWiht("main_badge"), forState: .Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(11)
        
        
        
        
    
    
    }
    
    
    
    
    
    
    /**
     返回一张从中间位置拉伸的图片
     */
    
    func  resizableImageWiht(imageName:String) ->UIImage{
    
    
        let image = UIImage(named: imageName)
        
      return  image!.stretchableImageWithLeftCapWidth(Int(image!.size.width * 0.5), topCapHeight:Int(image!.size.height * 0.5))
        
        
    
    }
    
    
    
    
    
    
}

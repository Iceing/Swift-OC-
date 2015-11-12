//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit

class LmTabBarButton: UIButton {

    let IMAGE_RATIO:CGFloat = 0.7
    var item:UITabBarItem!
    
    let badgeButton = LmBadgeButton()
    
    var itemValue:UITabBarItem{
    
    
        get{
        
        
            return self.item
        }
        
        set{
        
        
            self.item = newValue
            
            self.item.addObserver(self, forKeyPath: "title", options: .New, context: nil)
            self.item.addObserver(self, forKeyPath: "image", options: .New, context: nil)
            self.item.addObserver(self, forKeyPath: "selectedImage", options: .New, context: nil)
            self.item.addObserver(self, forKeyPath: "badgeValue", options: .New, context: nil)
            
           self.observeValueForKeyPath(nil , ofObject: nil , change: nil, context: nil )
            
            
            
            
        }
    
    
    }
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
   
        
        self.setImage(self.item.image, forState: .Normal)
        self.setTitle(self.item.title, forState: .Normal)
        self.setImage(self.item.selectedImage, forState: .Selected)
        
        if let str:String = self.item.badgeValue{
        
        
            self.badgeButton.setBadgeValueWith(str)
        
        }
        
        
        
        
        
        
        
        
    }
   
    
    
    deinit{
    
    
        self.item.removeObserver(self, forKeyPath: "title")
         self.item.removeObserver(self, forKeyPath: "image")
         self.item.removeObserver(self, forKeyPath: "selectedImage")
        self.item.removeObserver(self, forKeyPath: "badgeValue")
    }
    
    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        
        let imageX:CGFloat = 0
        let imageY:CGFloat = 0
        let imageW:CGFloat = contentRect.size.width
        let imageH:CGFloat = contentRect.size.height * IMAGE_RATIO
        
        return CGRectMake(imageX, imageY, imageW, imageH)
        
        
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        
        
        let titleX:CGFloat = 0
        let titleY:CGFloat = contentRect.size.height * IMAGE_RATIO
        let titleW:CGFloat = contentRect.size.width
        let titleH:CGFloat = contentRect.size.height - titleY
        
        return CGRectMake(titleX, titleY, titleW, titleH)
        
        
    }
    
    override var highlighted: Bool{
        
        
        get{
        
            
            return false
        }
        
        set {
        
        
        
        }
        
    
    
    }
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
         self.setBtnUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setBtnUI()
    }
    
    
    func setBtnUI(){
    
        
        self.imageView?.contentMode = .Center
        self.titleLabel?.textAlignment = .Center
        self.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        setTitleColor(UIColor.orangeColor(), forState: .Selected)
        
        
        
        self.addSubview(self.badgeButton)
        
        
        
    }
    
    override func layoutSubviews() {
        
        
        super.layoutSubviews()
        
        let badgeY:CGFloat = 5
        
        let badgeX = self.frame.size.width * 0.5 + 5.0
        
        var badgeFrame:CGRect = self.badgeButton.frame
        
        
        badgeFrame.origin.x = badgeX
        
        badgeFrame.origin.y = badgeY
        
        self.badgeButton.frame = badgeFrame
        
        
        
    }
    
    
}

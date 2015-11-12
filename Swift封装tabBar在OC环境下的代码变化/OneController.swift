//
//  LmNavigationController.swift
//  封装tabBar
//
//  Created by 陆明 on 15/11/12.
//  Copyright © 2015年 lm. All rights reserved.
//

import UIKit

class OneController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let  btn = UIButton.init(type: .ContactAdd)
        
        
       btn.frame = CGRectMake(0, 0, 20, 20)
        
        
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(btn)
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Done, target: nil, action: nil)
        
        
        
    }

    func btnClick(sender:UIButton){
    
    
        self.tabBarItem.badgeValue = "55555555"
        let view = UIViewController()
        view.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController!.pushViewController(view, animated: true)
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

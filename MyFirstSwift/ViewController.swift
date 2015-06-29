//
//  ViewController.swift
//  MyFirstSwift
//
//  Created by 张国礼 on 15/6/19.
//  Copyright (c) 2015年 WanShangWeiMeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var loginBtn: UIButton!

    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var passwordImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
        self.emailTextFiled.delegate = self
        self.passwordTextField.delegate = self
    
    }


    //按钮被点击
    @IBAction func loginBtnClicked(sender: UIButton) {
        
        //loginBtn Animation
        //step1
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.loginBtn.transform = CGAffineTransformMakeTranslation(10, 0)
            }) { (Bool complete) -> Void in
                //step2
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.loginBtn.transform = CGAffineTransformMakeTranslation(-10, 0)
                    }, completion: { (Bool complete) -> Void in
                        //step3
                        UIView.animateWithDuration(0.1, animations: { () -> Void in
                            self.loginBtn.transform = CGAffineTransformMakeTranslation(0, 0)
                        })
                })
        }
        
        
        //DialogView Animation
        //step1
        
        let moveYOffset = self.dialogView.frame.origin.y == 144 ? self.dialogView.frame.origin.y-44 : self.dialogView.frame.origin.y
        
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            
            self.dialogView.frame = CGRectMake(self.dialogView.frame.origin.x, moveYOffset, self.dialogView.frame.size.width, 330)
            }, completion: nil)
        
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField .isEqual(self.emailTextFiled)
        {
            self.emailTextFiled.background = UIImage(named:"input-outline-active")
            self.passwordTextField.background = UIImage(named: "input-outline")
            self.emailImageView.image = UIImage(named: "icon-mail-active")
            self.passwordImageView.image = UIImage(named: "icon-password")
        }else
        {
            self.emailTextFiled.background = UIImage(named:"input-outline")
            self.passwordTextField.background = UIImage(named: "input-outline-active")
            self.emailImageView.image = UIImage(named: "icon-mail")
            self.passwordImageView.image = UIImage(named: "icon-password-active")
        }
    }
}


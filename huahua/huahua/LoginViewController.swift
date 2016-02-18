//
//  LoginViewController.swift
//  huahua
//
//  Created by 黄伟昌 on 16/2/16.
//  Copyright © 2016年 黄伟昌. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var reg_btn: UIButton!
   
    @IBOutlet weak var login_btn: UIButton!
    
    @IBOutlet weak var login_line: UITextField!
    @IBOutlet weak var pwd_line: UITextField!
    
   
    @IBOutlet weak var reset_pwd_btn: UIButton!
    @IBOutlet weak var non_user_btn: UIButton!
    
    @IBOutlet weak var account_input: UITextField!
    @IBOutlet weak var pwd_input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        login_btn.backgroundColor = colorWithHexString("#4da800")
        login_btn.setTitleColor(colorWithHexString("#ffffff"), forState: UIControlState.Normal)
        
        reg_btn.setTitleColor(colorWithHexString("#333333"), forState: UIControlState.Normal)
        reg_btn.layer.borderWidth = 1
        reg_btn.layer.borderColor = colorWithHexString("#d0d0d0").CGColor
        
        
        //设置输入框的2条线
        login_line.layer.borderColor = colorWithHexString("#d0d0d0").CGColor
        login_line.layer.borderWidth = 0.5
        pwd_line.layer.borderColor = colorWithHexString("#d0d0d0").CGColor
        pwd_line.layer.borderWidth = 0.5
        
        //设置忘记密码&游客登录按钮
        reset_pwd_btn.setTitleColor(colorWithHexString("#999999"), forState: UIControlState.Normal)
        non_user_btn.setTitleColor(colorWithHexString("#494949"), forState: UIControlState.Normal)
        
        //设置输入框
        account_input.textColor = colorWithHexString("#2f2f2f")
        pwd_input.secureTextEntry = true
        
    }

    @IBAction func CloseKeyboard(sender: AnyObject) {
        pwd_input.resignFirstResponder()
        account_input.resignFirstResponder()
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login_click(sender: UIButton) {
        
        let account = account_input.text!
        let password = pwd_input.text!
        if account.characters.count > 0 && password.characters.count > 0  {
            Privilege.login(account, log_password: password)

        }else{
            //密码账户不能为空
        }
        
       
        
        
        
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

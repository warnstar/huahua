


//
//  PrivilegeController.swift
//  huahua
//
//  Created by 黄伟昌 on 16/2/17.
//  Copyright © 2016年 黄伟昌. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Privilege{
     static let login_url:String = SERVER_URL + "/privilege/login/"
    
     static func login(log_account:String,log_password:String)->String{
        //账户密码数据处理
        let my_account = log_account
        let my_password = log_password
        
        //构造提交数据
        let req_data = [
            "phone":my_account,
            "password":my_password
        ]
        
        //请求网络
        Alamofire.request(.POST,Privilege.login_url, parameters: req_data).validate().responseJSON{
            response in
            
            if let value = response.result.value {
                let json = JSON(value)
                let aa = json.dictionary
                print(aa?["code"])
                print(aa?.count)
                for i in (aa?.keys)!{
                    print(aa![i])
                }
                print("JSON: \(json)")
                
            }
            else{
                print("FAIL")
            }
            
        }
        return ""
    }
    
}
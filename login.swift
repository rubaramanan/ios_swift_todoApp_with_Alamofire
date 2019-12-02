//
//  login.swift
//  catwalk
//
//  Created by student on 2/21/19.
//  Copyright © 2019 Kryptonite. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class login: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var log: UIButton!
    
    let api: String="http://10.10.17.207:8056/api/auth/signin"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        log.layer.cornerRadius=12
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: Any) {
        let temail=email.text
        let tpass=pass.text
       // let bool=isValidEmailAddress(emailAddressString: temail!)
        if((temail!.isEmpty) && (tpass!.isEmpty)){
            
            self.alertView(message: "please enter all field")
//        }else if(bool==false){
//            self.alertView(message: "please enter valid email")
        }
            else{
            let log:Parameters=["username":email.text,"password":pass.text]
            
            Alamofire.request(api, method: .post, parameters: log, encoding: JSONEncoding.default)
                .responseSwiftyJSON { response in
                    
                    switch response.result{
                    case.success(let value):
                        let json=JSON(value)
                        let user=json["username"]
                        print(json)
                        print(user)
                       // self.alertView(message: "login success")
                        if user != nil{
                        let homepage=self.storyboard?.instantiateViewController(withIdentifier: "homepage") as! Homepage
                        self.navigationController?.pushViewController(homepage, animated: true)}
                        else{
                            self.alertView(message: "please signup your account")
                        }
                    case.failure(let error):
                        self.alertView(message: "\(error.localizedDescription)")
                        }
                    
                    
                    
//
            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    func alertView(message:String){
        let alert = UIAlertController(title: "Hi User", message:message ,preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion:nil)
    }
}

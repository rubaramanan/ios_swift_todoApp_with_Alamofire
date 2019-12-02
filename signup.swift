//
//  signup.swift
//  catwalk
//
//  Created by student on 2/21/19.
//  Copyright © 2019 Kryptonite. All rights reserved.
//

import UIKit
import  Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON


class signup: UIViewController{

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var cpass: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var Date: UITextField!
    
    let api: String="http://10.10.17.207:8056/api/auth/signup"
    
    private var Datepick: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    
        
        Datepick=UIDatePicker()
        Datepick.datePickerMode = .date
        Datepick.addTarget(self, action: #selector(self.dateChang(Datepick:)), for: .valueChanged)
        
        
        let tapped=UITapGestureRecognizer(target: self, action: #selector(self.ViewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapped)
        Date.inputView=Datepick
        
          //delegate use pannum textfield
        create.layer.cornerRadius=12
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func ViewTapped(gestureRecognizer: UIGestureRecognizer){
        view.endEditing(true)
    }
    @objc func  dateChang(Datepick: UIDatePicker) {
        let DateFormatte=DateFormatter()
      // DateFormatte.dateFormat="YYYY-MM-dd"
        DateFormatte.dateStyle=DateFormatter.Style.short
        Date.text=DateFormatte.string(from:self.Datepick.date)
        view.endEditing(true)
    }

    @IBAction func create_click(_ sender: Any) {
        let temail=email.text
        let tfname=fname.text
        let tpass=pass.text
        let tcpass=cpass.text
        let emi=isValidEmailAddress(emailAddressString: temail!)
        let pssi=isPasswordValid(tpass!)
        let nString = tpass! as NSString
        
        
        
        if(!(temail?.isEmpty)! && !(tfname?.isEmpty)! && !(tpass?.isEmpty)! && !(tcpass?.isEmpty)!){
            if(emi==true){
                if(nString.length>=8){
                    if(pssi==true){
                        let parameter:Parameters=["name":fname.text,"username":fname.text,"email":email.text,"role":["user"],"password":pass.text]
                        
                        
                        Alamofire.request(api, method: .post, parameters: parameter,
                                          encoding: JSONEncoding.default)
                            .responseJSON { response in
                                guard response.result.error == nil else {
                                    // got an error in getting the data, need to handle it
                                    print("error calling POST on /todos/1")
                                    print(response.result.error!)
                                    return
                                }
                                // make sure we got some JSON since that's what we expect
                                guard let json = response.result.value as? [String: Any] else {
                                    print("didn't get todo object as JSON from API")
                                    print("Error: \(response.result.error)")
                                    return
                                }
                                // get and print the title
//                                guard let todoTitle = json["username"] as? String else {
//                                    print("Could not get todo title from JSON")
//                                    return
//                                }
//                                print("The title is: " + todoTitle)
                        }
                    }else{
                        alertView(message: "please enter same password")
                    }
                }else{
                    alertView(message: "please enter Strong oassword")
                }
                
            }else{
                alertView(message: "please enter valid email")
            }
            
    }else{
        self.alertView(message: "you must fill all field")
        }
        
        
        }
    
   // this function for email syntax validation
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
    
    // this function for alert message
    func alertView(message:String){
    let alert = UIAlertController(title: "Hi User", message:message ,preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
}
    alert.addAction(OKAction)
    self.present(alert, animated: true, completion:nil)
    }
    
    //this function for both passwords are match
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
//    // this one use delegate for age only integer
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        let allowchar=CharacterSet.decimalDigits
//       // let allowCharset=CharacterSet(charactersIn: allowchar)
//        let typecharset=CharacterSet(charactersIn: string)
//        return allowchar.isSuperset(of: typecharset)
//
//    }
    
}

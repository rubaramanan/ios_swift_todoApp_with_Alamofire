//
//  ViewController.swift
//  catwalk
//
//  Created by student on 2/21/19.
//  Copyright © 2019 Kryptonite. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController ,GIDSignInUIDelegate{
    //@IBOutlet weak var sign: UIButton!
    @IBOutlet weak var google_view: UIView!
    let login_button_google = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // hideKeyboard()
        GIDSignIn.sharedInstance().uiDelegate = self
       // GIDSignIn.sharedInstance().delegate = self as? GIDSignInDelegate
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        
        login_button_google.center = self.google_view.center
        self.view!.addSubview(login_button_google)
        
    }
    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//                withError error: NSError!) {
//
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            userId = user.userID // For client-side use only!
//            idToken = user.authentication.idToken // Safe to send to the server
//            fullName = user.profile.name
//            email = user.profile.email
//            performSegueWithIdentifier("loginToDoing", sender: nil)
//
//        } else {
//            print("\(error.localizedDescription)")
//        }
//    }

}


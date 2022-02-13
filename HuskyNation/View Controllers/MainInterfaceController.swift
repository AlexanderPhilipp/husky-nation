//
//  MainInterfaceController.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/11/21.
//

import UIKit
import WebKit;

class MainInterfaceController : UITabBarController
{
    static var apiHelper = ApiHelper(); //API Helper Class for interactions with the Blackbaud solution
    let bypassAuth : Bool = false
    
    static var currentSessionUserAuth : UserAuthorization = UserAuthorization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(!bypassAuth){
            MainInterfaceController.apiHelper.RequestAuthorization(viewController: self)
        }
    }
    
    static func exitAuthorization(userAuth : UserAuthorization, view : UIViewController){
        currentSessionUserAuth = userAuth
        if(userAuth.isAuthorized){
            view.dismiss(animated: true) { }
        }
    }
}

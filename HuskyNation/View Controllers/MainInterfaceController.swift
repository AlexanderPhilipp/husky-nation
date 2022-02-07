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
    var apiHelper = ApiHelper(); //API Helper Class for interactions with the Blackbaud solution
    let bypassAuth : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(!bypassAuth){
            apiHelper.RequestAuthorization(viewController: self)
        }
    }
    
    static func exitAuthorization(userAuth : UserAuthorization, view : UIViewController){
        if(userAuth.isAuthorized){
            view.dismiss(animated: true) { }
        }
    }
}

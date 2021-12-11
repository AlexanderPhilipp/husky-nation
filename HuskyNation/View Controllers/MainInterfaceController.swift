//
//  MainInterfaceController.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/11/21.
//

import UIKit

class MainInterfaceController : UITabBarController
{
    var apiHelper : ApiHelper?;                     //API Helper Class for interactions with the Blackbaud solution
    let AuthorizationWindow = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        apiHelper = ApiHelper(Endpoint: "");
        if(apiHelper?.IsAuthorized == false){
            performSegue(withIdentifier: "AuthPopOver", sender: nil)
        }
    }
}

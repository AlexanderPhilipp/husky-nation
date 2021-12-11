//
//  ApiHelper.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/11/21.
//


//Class for interacting with the Sky API
//
//Request data by awaiting desired function
//Initialize with the url of the Sky API Endpoint
import WebKit;

class ApiHelper{
    let AuthorizationEndPoint = "https://oauth2.sky.blackbaud.com/authorization"; //End point for authorization request
    let AuthorizationRedirectURI = "https://alexanderphilipp.net/NHS/Redirect-Auth.php";
    let ApplicationID = "a7d7ad41-f1d3-44a3-93fb-56899cff410e"; //Application ID used for authorization and api calls
    
    //Runtime
    var IsAuthorized : Bool = false;
    
    func RequestAuthorization(viewController : UIViewController){
        let authRequest : String = AuthorizationEndPoint + "?client_id=" + ApplicationID + "&response_type=token" + "&redirect_uri=" + AuthorizationRedirectURI + "&state=" + "fdf80155";

        guard let url = URL(string: authRequest) else{
            return;
        };
        let authPageController = AuthorizationPageView(url: url, title: "Authorization");
        let navigationController = UINavigationController(rootViewController: authPageController);
        viewController.present(navigationController, animated: true);
    }
}

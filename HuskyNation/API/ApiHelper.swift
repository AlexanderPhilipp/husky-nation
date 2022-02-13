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
    var currentSessionUserAuth : UserAuthorization = UserAuthorization()
    
    let ApplicationID = "a7d7ad41-f1d3-44a3-93fb-56899cff410e"; //Application ID used for authorization and api calls
    
    
    let AuthorizationRedirectURI = "https://alexanderphilipp.net/NHS/Redirect-Auth.php";    //Redirection URL to Web Server
    let AuthorizationEndPoint = "https://oauth2.sky.blackbaud.com/authorization";           //End point for authorization request
    
    let subscriptionKey = "0a2622b29d704eb297f3d88fbcbfbec7";
    let AssignmentFetchEndPoint = "https://api.sky.blackbaud.com/school/v1/academics/sections/1/assignments?";
    
    
    func RequestAuthorization(viewController : UIViewController){
        let authRequest : String = AuthorizationEndPoint + "?client_id=" + ApplicationID + "&response_type=token" + "&redirect_uri=" + AuthorizationRedirectURI + "&state=" + "fdf80155";

        guard let url = URL(string: authRequest) else{
            print("Failed to create URL")
            return;
        };
        let authPageController = AuthorizationPageView(url: url, title: "Authorization");
        let navigationController = UINavigationController(rootViewController: authPageController);
        viewController.present(navigationController, animated: true);
    }
    
    
    func GetAssignments () -> [AssignmentData]{
        let fetchedAssignments : [AssignmentData] =
            [AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false)]
        
        let urlString = AssignmentFetchEndPoint + "&persona_id=2"
        guard let fetchURL = URL(string: urlString) else{
            return fetchedAssignments;
        };
        
        print(urlString)
        
        var fetchRequest = URLRequest(url: fetchURL)
        fetchRequest.setValue(subscriptionKey, forHTTPHeaderField: "Bb-Api-Subscription-Key")
        fetchRequest.setValue("bearer " + MainInterfaceController.currentSessionUserAuth.accessToken, forHTTPHeaderField: "Authorization")
        
        let requestTask = URLSession.shared.dataTask(with: fetchRequest) { data, response, error in
            if let data = data {
                let dataString = String(data : data, encoding: .utf8);
                print(dataString)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        requestTask.resume()
        
        return fetchedAssignments
    }
}

struct TestData : Decodable{
    let id : Int
    let date : String
    let description : String
    let discussion : Bool
    let due_date  : String
    let enrolled : Int
    let graded_count : Int
    let index_id : Int
    let major : Bool
    let name : String
    let publish_on_assigned : Bool
    let published : Bool
    let rank : Int
    let type : String
    let type_id : Int
}

struct AssignmentData{
    let assignmentID : Int;
    let assignedDate : Date;
    let dueDate : Date;
    let assignmentDescription : String;
    let discussion : Bool;
    
    init(id : Int, aDate : Date, dDate : Date, desc : String, disc : Bool){
        self.assignmentID = id;
        self.assignedDate = aDate;
        self.dueDate = dDate;
        self.assignmentDescription = desc;
        self.discussion = disc;
    }
}

struct UserAuthorization{
    var accessToken : String;
    var tokenType : String;
    var expiresInSeconds : Int;
    var state : String;
    var environmentId : String;
    var environmentName : String;
    var legalEntityId : String;
    var legalEntityName : String;
    var userId : String;
    var emailAdress : String;
    var lastName : String;
    var firstName : String;
    var isAuthorized : Bool;
    
    init(){
        self.accessToken = "";
        self.tokenType = "";
        self.expiresInSeconds = 0;
        self.state = "";
        self.environmentId = "";
        self.environmentName = "";
        self.legalEntityId = "";
        self.legalEntityName = "";
        self.userId = "";
        self.emailAdress = "";
        self.lastName = "";
        self.firstName = "";
        self.isAuthorized = false;
    }
}

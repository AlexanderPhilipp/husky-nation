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

class ApiHelper{
    let ApiEndpoint : String;
    var IsAuthorized : Bool = false;
    
    init(Endpoint : String){
        ApiEndpoint = Endpoint;
        IsAuthorized = false;
    }
    
    func requestAuthorization(Username: String, Password : String){
        
    }
    func getAssignments(){
        
    }
}

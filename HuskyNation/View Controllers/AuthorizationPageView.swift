//
//  AuthorizationPageView.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/11/21.
//

import UIKit
import WebKit;

class AuthorizationPageView : UIViewController {

    private let redirectionServerAdress = "alexanderphilipp.net";
    
    private let webView : WKWebView = {
        let preferences = WKPreferences();
        preferences.javaScriptEnabled = true;
        let configuration = WKWebViewConfiguration();
        configuration.preferences = preferences;
        let webView = WKWebView(frame: .zero, configuration: configuration);
        return webView;
    }()
    
    private let url : URL;
    
    
    var redirectionCheckTimer = Timer()

    
    init(url : URL, title : String){
        self.url = url;
        super.init(nibName: nil, bundle: nil)
        self.title = title;
        
        redirectionCheckTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: { _ in
            self.checkForRedirection()
        })
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white;
        view.addSubview(webView);
        isModalInPresentation = false;
        webView.load(URLRequest(url: url));
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        webView.frame = view.bounds;
    }
    
    
    var hasRedirected = false;
    func checkForRedirection(){
        let currentURL = webView.url;
        if(currentURL?.host == redirectionServerAdress){
            if(!webView.isLoading){
                if(!hasRedirected){
                    hasRedirected = true;
                    onAuthorizationRedirection(fragment: currentURL?.fragment)
                }
            }
        }
    }
    
    func onAuthorizationRedirection(fragment : String?){
        
        let fragments = fragment?.components(separatedBy: "&");
        var authData = UserAuthorization()
        
        for index in (0...fragments!.count - 1){
            let value = fragments![index].components(separatedBy: "=")[1];
                 
            switch index{
            case 0:
                authData.accessToken = value;
                break;
            case 1:
                authData.tokenType = value;
                break;
            case 2:
                authData.expiresInSeconds = Int(value) ?? 0;
                break;
            case 3:
                authData.state = value;
                break;
            case 4:
                authData.environmentId = value;
                break;
            case 5:
                authData.environmentName = value;
                break;
            case 6:
                authData.legalEntityId = value;
                break;
            case 7:
                authData.legalEntityName = value;
                break;
            case 8:
                authData.userId = value;
                break;
            case 9:
                authData.emailAdress = value;
                break;
            case 10:
                authData.lastName = value;
                break;
            case 11:
                authData.firstName = value;
                break;
            default:
                authData = UserAuthorization();
            }
        }
        authData.isAuthorized = true;
        MainInterfaceController.exitAuthorization(userAuth: authData, view: self)
    }
}

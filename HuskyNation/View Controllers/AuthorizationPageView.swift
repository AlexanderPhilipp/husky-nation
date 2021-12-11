//
//  AuthorizationPageView.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/11/21.
//

import UIKit
import WebKit;

class AuthorizationPageView : UIViewController {

    
    private let webView : WKWebView = {
        let preferences = WKPreferences();
        preferences.javaScriptEnabled = true;
        let configuration = WKWebViewConfiguration();
        configuration.preferences = preferences;
        let webView = WKWebView(frame: .zero, configuration: configuration);
        return webView;
    }()
    
    private let url : URL;
    
    init(url : URL, title : String){
        self.url = url;
        super.init(nibName: nil, bundle: nil)
        self.title = title;
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white;
        view.addSubview(webView);
        webView.load(URLRequest(url: url));
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        webView.frame = view.bounds;
    }
}

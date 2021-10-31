//
//  Wiki.swift
//  Project16MapKit
//
//  Created by Igor Polousov on 31.10.2021.
//

import UIKit
import WebKit

class Wiki: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var html: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmls = html {
            let url = URL(string: htmls)!
            webView.load(URLRequest(url: url))
        }
    }
    
}

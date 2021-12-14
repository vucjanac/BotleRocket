//
//  InternetsViewController.swift
//  BottleRocket
//
//  Created by Aleksandar Stojanovic on 12/10/21.
//

import UIKit
import WebKit

class InternetsViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView?
    
    override func loadView() {
        webView = WKWebView()
        webView?.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.bottlerocketstudios.com")!
        webView?.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = true

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

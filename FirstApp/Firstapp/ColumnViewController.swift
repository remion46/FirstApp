//
//  ColumnViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/08/18.
//

import UIKit
import WebKit

class ColumnViewController: UIViewController {
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://remion46.hatenablog.com/") {  // URL文字列の表記間違いなどで、URL()がnilになる場合があるため、nilにならない場合のみ以下のload()が実行されるようにしている
            self.webview.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
        }
    

    }
}

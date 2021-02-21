//
//  TimelineViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//

import UIKit

class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            let defaults = UserDefaults.standard
            defaults.register(defaults: ["FirstLaunch" : true])
            if defaults.bool(forKey: "FirstLaunch") == true {
                UserDefaults.standard.set(false, forKey: "FirstLaunch")
                let new_uuid = NSUUID().uuidString
                UserDefaults.standard.set(new_uuid, forKey: "uuid")
                 print("new!! \n \(new_uuid) \n\n")
                print("初回の起動です")
                let TimelineViewController = self.storyboard?.instantiateViewController(withIdentifier: "ログイン画面のstoryboardのidentifier") as! TimelineViewController
            self.present(TimelineViewController, animated: true, completion: nil)
            }else{
                UserDefaults.standard.set(false, forKey: "FirstLaunch")
                print("２回目以降の起動です")
            }
        }

}

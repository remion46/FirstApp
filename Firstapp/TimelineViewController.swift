//
//  TimelineViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let TODO = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TODO.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
                cell.textLabel!.text = TODO[indexPath.row]
        
                return cell
    }
    


}

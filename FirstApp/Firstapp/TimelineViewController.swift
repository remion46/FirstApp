//
//  TimelineViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//
import UIKit
import Firebase
import FirebaseFirestore


class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var searchField: UISearchBar!
   
    var questionDataArray:[NSObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            view.endEditing(true)
            if let word = searchBar.text {
                print(word)
            }
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
           return self.questionDataArray.count
    }
    //セルの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "questioncell") as! UITableViewCell
//           cell.questionData = self.questionDataArray[indexPath.row]
           return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func getData() {
        //データがあるコレクションを指定
        let Ref = Firestore.firestore().collection("questions")
        //getDocumentsでデータを取得
        Ref.getDocuments() { (querySnapshot, error) in
               if let error = error {
                   print(error)
                   return
               }
            querySnapshot!.documents.map { document in
                let data = questionData(dic: document)
                self.questionDataArray.append(data);
            }
        }
    }
}
class questionData: NSObject {
                var name: String?
                var uuid: String?
                var created_at: CVTimeStamp?
                var content: String?
                //init()について解説置いています。
                init(dic: QueryDocumentSnapshot) {
                    self.name = dic["name"] as? String
                    self.uuid = dic["uuid"] as? String
                    self.created_at = dic["createdAt"] as? CVTimeStamp
                    self.content = dic ["question"] as? String
               }
}

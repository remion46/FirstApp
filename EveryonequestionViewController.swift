//
//  EveryonequestionViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//

import UIKit
import Firebase
import FirebaseFirestore

struct Question {

    let name: String
    let uuid: String
    let created_at: Timestamp
    let content: String


    init(dic: [String: Any]) {
        self.name = dic["name"] as! String
        self.uuid = dic["uuid"] as! String
        self.created_at = dic["createdAt"] as! Timestamp
        self.content = dic ["question"] as! String
    }
}

class EveryonequestionViewController: UIViewController, UITextViewDelegate{
    @IBOutlet weak var postbutton: UIButton!
    
    @IBOutlet weak var questionfield: UITextView!
    
    @IBAction func post(_ sender: Any) {
        let db = Firestore.firestore()
        let uuid = (UserDefaults.standard.object(forKey: "uuid"))!
        //setは登録するだけなので（データの書き込み）
        UserDefaults.standard.set("ユーザー１", forKey: "userName")
        //これでuserNameというキーでユーザー１という値が保存されました。なので読み込みます
        //読み込むときは　UserDefaults.standard.object(forkey: "キーの名前")なので。。
        let name:String = (UserDefaults.standard.object(forKey: "userName")) as! String
       //これでnameという変数には先ほどの ユーザー１　という名前が変数として保存されています
        var ref: DocumentReference? = nil
        ref = db.collection("questions").document()
        let submit_data = [
          "user_id": uuid ,
          "name": name ,
          "created_at": Date(),
          "content": "質問"
        ] as [String : Any]
        ref?.setData(submit_data){ err in
          if let err = err {
            print("Error adding document: \(err)")
          } else {
            print("保存に成功しました！");
    }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postbutton.layer.cornerRadius = 10
        postbutton.isEnabled = false
        postbutton.backgroundColor = UIColor.rgb(red: 204, green: 204, blue: 204)
        questionfield.delegate = self
    }
    
}

extension EveryonequestionViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        let questionIsEmpty = questionfield.text?.isEmpty ?? true
        
        if questionIsEmpty { postbutton.isEnabled = false
            postbutton.backgroundColor = UIColor.rgb(red: 204, green: 204, blue: 204)
        } else {
            postbutton.isEnabled = true
            postbutton.backgroundColor = UIColor.rgb(red: 135, green: 206, blue: 235)
            postbutton.layer.cornerRadius = 10
        }
            
        }
        
    }




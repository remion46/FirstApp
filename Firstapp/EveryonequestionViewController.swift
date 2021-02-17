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
    let createdAt: Timestamp
    let question: String


    init(dic: [String: Any]) {
        self.name = dic["name"] as! String
        self.createdAt = dic["createdAt"] as! Timestamp
        self.question = dic ["question"] as! String
    }
}

class EveryonequestionViewController: UIViewController, UITextViewDelegate{
    @IBOutlet weak var postbutton: UIButton!
    
    @IBOutlet weak var questionfield: UITextView!
    
    @IBAction func post(_ sender: Any) {
        
        let db = Firestore.firestore()
        let uuid = (UserDefaults.standard.object(forKey: "uuid"))!
        var ref: DocumentReference? = nil
        ref = db.collection("tweets").document()
        let submit_data = [
            "user_id": uuid ,
            "created_at": Date(),
            "content": "ここに質問内容"
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




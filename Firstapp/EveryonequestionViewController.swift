//
//  EveryonequestionViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//

import UIKit
import Firebase

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
    
    var defaultstore:Firestore!
        var handle:Auth?
    
    @IBAction func post(_ sender: Any) {
        
        handleAuthToFirebasequestion()
    }
    
    private func handleAuthToFirebasequestion(){
        
        guard let question = questionfield.text else { return  }

        
        Auth.auth().
            if let err = err {
                print("認証情報の保存に失敗しました\(err)")
                return
            }
            self.addquestioninfotofirestore(quetion: question)
        }
    
    
    private func addquestioninfotofirestore(question: String){
        guard let qid = Auth.auth().currentUser?.uid else { return }
        guard let question = self.questionfield.text else { return }

        let docdata = ["name": name ,"question": question,"createdAt": Timestamp()] as [String : Any ]
        let questionrref = Firestore.firestore().collection("users").document(qid)

            
            questionref.setData(docdata) { (err) in
                if let err = err {
                    print("Firestoreの保存に失敗しました\(err)")
                    return
                }
                print("Firestoreの保存に成功しました")
                
                questionref.getDocument { (snapshot, err) in
                    if let err = err {
                        print("ユーザ情報の取得に失敗しました\(err)")
                        
                    }

                
                    guard let data = snapshot?.data() else { return }

                    let question = Question.init(dic: data)

                    print("ユーザ情報の取得に成功しました\(user.name)")
                    
                
                }
        }
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postbutton.layer.cornerRadius = 10
        postbutton.isEnabled = false
        postbutton.backgroundColor = UIColor.rgb(red: 204, green: 204, blue: 204)
        questionfield.delegate = self
        
        defaultstore = Firestore.firestore()

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




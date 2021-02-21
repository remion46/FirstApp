//
//  AllquestionViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/02/16.
//

import UIKit

class AllquestionViewController: UIViewController {

    @IBOutlet weak var everyonequesion: UIButton!
    
    
    @IBOutlet weak var onepersonquestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        everyonequesion.layer.cornerRadius = 20
        everyonequesion.layer.borderColor = UIColor.black.cgColor
        
        onepersonquestion.layer.cornerRadius = 20
        onepersonquestion.layer.borderColor = UIColor.black.cgColor
        
        
        
        
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

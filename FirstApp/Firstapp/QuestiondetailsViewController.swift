//
//  QuestiondetailsViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/06/28.
//

import UIKit

class QuestiondetailsViewController: UIViewController {
    
    @IBOutlet weak var Questionuserimageview: UIImageView!
    
    @IBOutlet weak var Questionusername: UILabel!
    
    @IBOutlet weak var Questiondate: UILabel!
    
    @IBOutlet weak var Questioncontent: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

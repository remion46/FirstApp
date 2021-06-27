//
//  SettingViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/06/25.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "settingviewcell", bundle: nil), forCellReuseIdentifier: "settingviewcell")
    }
}

extension SettingViewController: UITableViewDataSource {

    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingviewcell")!
        
        let cell1 = cell.viewWithTag(1) as! UILabel
        cell1.text = "プロフィールの編集"

        let cell2 = cell.viewWithTag(2) as! UILabel
        cell2.text = "利用規約"

        let cell3 = cell.viewWithTag(3) as! UILabel
        cell3.text = "プライバシーポリシー"

        let cell4 = cell.viewWithTag(4) as! UILabel
        cell4.text = "お問い合わせ"
        
        return cell
    }

    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SettingViewController: UITableViewDelegate {

    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
            // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
     
            // 別の画面に遷移
        //identiferはまだ決めていない
            performSegue(withIdentifier: "toNextViewController", sender: nil)
        }

    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

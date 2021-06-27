//
//  ColumnViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/06/15.
//

import UIKit

class ColumnViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "columnviewcell", bundle: nil), forCellReuseIdentifier: "columnviewcell")
    }
}

extension ColumnViewController: UITableViewDataSource {

    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "columnviewcell")!
        return cell
    }

    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}

extension ColumnViewController: UITableViewDelegate {

    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }

    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

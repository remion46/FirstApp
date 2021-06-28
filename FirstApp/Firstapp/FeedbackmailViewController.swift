//
//  FeedbackmailViewController.swift
//  Firstapp
//
//  Created by 船越廉 on 2021/06/28.
//

import UIKit
import MessageUI

class InquiryViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func inquiryMail(_ sender: Any) {

        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["○○○@email.com"]) // 宛先アドレス
            mail.setSubject("お問い合わせ") // 件名
            mail.setMessageBody("ここに本文が入ります。", isHTML: false) // 本文
            present(mail, animated: true, completion: nil)
        } else {
            print("送信できません")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        switch result {
        case .cancelled:
            print("キャンセル")
        case .saved:
            print("下書き保存")
        case .sent:
            print("送信成功")
        default:
            print("送信失敗")
        }

        dismiss(animated: true, completion: nil)
    }
}

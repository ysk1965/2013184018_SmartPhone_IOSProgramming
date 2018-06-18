//
//  SettingViewController.swift
//  PlayInCBA_yoo
//
//  Created by 게임공학과 on 2018. 6. 10..
//  Copyright © 2018년 게임공학과. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBAction func CallAction(_ sender: Any) {
        let urlString = "tel://" + "010-6623-2545"
        let numberURL = NSURL(string: urlString)
        UIApplication.shared.openURL(numberURL! as URL)
    }
    var url = URL(string:"http://cba.sungrak.or.kr/HomePage/Index")
    
    @IBAction func SendWebAction(_ sender: Any) {
        url = URL(string:"http://cba.sungrak.or.kr/HomePage/Index")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    @IBAction func LinkToBlogAction(_ sender: Any) {
        url = URL(string:"https://thebondofpeace.blog.me/221107817302")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    @IBAction func LinkToYoutubeAction(_ sender: Any) {
        url = URL(string:"https://www.youtube.com/channel/UCW6bF9L0ZK__Tlwl19B0FYQ")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func InstagramAction(_ sender: Any) {
        url = URL(string:"https://www.instagram.com/cba.sungrak/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func SendMailAction(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
            print("can send mail")
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["enter_maintanance@naver.com"])
        mailComposerVC.setSubject("개발자 IOS 문의 메일")
        mailComposerVC.setMessageBody("여러분의 소중한 의견 감사드립니다. \n - 개발자 -", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", delegate: self, cancelButtonTitle: "확인")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    ////////////////////////////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

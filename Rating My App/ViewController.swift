//
//  ViewController.swift
//  Rating My App
//
//  Created by 陳信彰 on 2023/8/21.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func ratingApp(_ sender: UIButton) {
        // 1.手動跳到網站評價
        // Note: Replace the placeholder value below with the App Store ID for your app.
        //       You can find the App Store ID in your app's product URL.
        guard let writeReviewURL = URL(string: "https://apps.apple.com/tw/app/simply-record-voice/id6452241138?action=write-review")
        else { fatalError("Expected a valid URL") }
//        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
        // 2.呼叫評分視圖(不建議)
        requestAppReview()
    }
    
    func requestAppReview() {
        if #available(iOS 14.0, *) {
            if let windowScene = UIApplication.shared.windows.first?.windowScene {
                // 呼叫評分提示
                SKStoreReviewController.requestReview(in: windowScene)
            }
        } else {
            print("old version")
        }
    }
    
}


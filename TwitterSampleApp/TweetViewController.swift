//
//  TweetViewController.swift
//  TwitterSampleApp
//
//  Created by 染川勇 on 2023/07/24.
//

import UIKit

class TweetViewController: UIViewController {
    @IBOutlet weak var userNameView: UILabel!    
    @IBOutlet weak var tweetView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "ツイート", style: .done, target: self, action: #selector(tweet))
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    
    @objc func tweet() {
        print("ツイート文が押されました。")
    }
}

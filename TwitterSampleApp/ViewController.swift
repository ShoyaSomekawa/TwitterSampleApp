//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 染川翔哉 on 2023/06/30.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTweetButton: UIButton!
    
    // ツイートボタン（＋）をタップしたときの処理
    @IBAction func tapTweetButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetViewController = storyboard.instantiateViewController(identifier: "TweetViewController")
        navigationController?.pushViewController(tweetViewController, animated: true)
    }
    
    var tweetList: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        let tweet = tweetList[indexPath.row]
        cell.tweet = tweet
        cell.userName.text = tweet.userName
        cell.label.text = tweet.text
        cell.indexPath = indexPath
        return cell
    }
}





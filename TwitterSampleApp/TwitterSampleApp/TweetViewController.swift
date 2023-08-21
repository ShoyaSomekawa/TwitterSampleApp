//
//  TweetViewController.swift
//  TwitterSampleApp
//
//  Created by 染川勇 on 2023/07/24.
//

import UIKit
import RealmSwift


class TweetViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var userNameView: UILabel!
    @IBOutlet weak var tweetView: UITextView!
    
    var tweetData = tweetDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetView.delegate = self
        //ツイートボタンの作成
        let barButton = UIBarButtonItem(title: "ツイート", style: .done, target: self, action: #selector(tweet))
        navigationItem.rightBarButtonItem = barButton
        
        // ツールバー生成 サイズはsizeToFitメソッドで自動で調整される。
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        //サイズの自動調整。敢えて手動で実装したい場合はCGRectに記述してsizeToFitは呼び出さない。
        
        toolBar.sizeToFit()
        // 左側のBarButtonItemはflexibleSpace。これがないと右に寄らない。
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // Doneボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))
        
        // BarButtonItemの配置
        toolBar.items = [spacer, commitButton]
        // textViewのキーボードにツールバーを設定
        tweetView.inputAccessoryView = toolBar
    }
    // テーブルビューセルからツイート画面に遷移したときのみ行われる処理
    func configure(tweet: tweetDataModel) {
        tweetData.text = tweet.text
        tweetData.userName = tweet.userName
    }
    
    // ツイート画面にユーザー名とツイートを表示するメソッド
    func displayTweet() {
        userNameView.text = tweetData.userName
    }
    
    //キーボードを閉じる処理
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    //TextView以外をタッチした時に閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func tweet() {
        //ツイートボタンを押すと前画面に戻る（画面遷移）
        self.navigationController?.popViewController(animated: true)
        print(tweetView.text!)
        //140字以内でツイートする（制限）ツイートボタンを押下できなくさせる、画面遷移でViewControllerに表示させる、Realmにデータ保存させる
        print("ツイート文が押されました。")
    }
    // tweetDataをrealmに保存するメソッド
    func saveData(currentUserName userName: String, currentTweet tweet: String) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(tweetData)
        }
    }
    
    extension TweetViewController: UITextViewDelegate {
        //１４０字以内で制御
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return textView.text.count + (text.count - range.length) <= 140
        }
        func textViewDidChange(_ textView: UITextView) {
            
        }
    }

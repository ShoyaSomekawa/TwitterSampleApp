//
//  TableViewCell.swift
//  TwitterSampleApp
//
//  Created by 染川勇 on 2023/07/17.
//

import UIKit
import RealmSwift

protocol UITableViewCellDelegate {
    func deleteTweet(indexPath: IndexPath)
    func transitionToEditedTweetView(indexPath: IndexPath)
}

class TableViewCell: UITableViewCell, UITableViewDelegate {
    
    //　編集ボタンを押す処理の追加
    @IBAction func editButton(_ sender: UIButton) {
        delegate?.transitionToEditedTweetView(indexPath: indexPath!)
    }
    //　削除ボタンを押す処理の追加
    @IBAction func deleteButton(_ sender: UIButton) {
        delegate?.deleteTweet(indexPath: indexPath!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var indexPath: IndexPath?
    var tweet: Tweet?
    var delegate: UITableViewCellDelegate?
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //　編集ボタンの仕様
       func setupEditButton() {
               editButton.layer.cornerRadius = 10
           editButton.clipsToBounds = true
    }
       //　削除ボタンの仕様
    func setupDeleteButton() {
        deleteButton.layer.cornerRadius = 10
        deleteButton.clipsToBounds = true
    }
}

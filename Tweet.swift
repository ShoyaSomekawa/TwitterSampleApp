//
//  Tweet.swift
//  TwitterSampleApp
//
//  Created by 染川勇 on 2023/07/31.
//

import Foundation
import RealmSwift

class Tweet: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
      @Persisted var text: String = ""
      @Persisted var userName: String = ""    
}

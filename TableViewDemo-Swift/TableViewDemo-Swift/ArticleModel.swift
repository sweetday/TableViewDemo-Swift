//
//  ArticleModel.swift
//  TableViewDemo-Swift
//
//  Created by Ssuperjoy on 2018/9/10.
//  Copyright © 2018年 Mr.Zhang. All rights reserved.
//

import Foundation

class ArticleModel {
    var title: String?
    var summary: String?
    var authorName: String?
    var authorPortraitUrl: String?
    var pubTime: String?
    
    init?(data: [String: Any]?) {
        guard let dict = data else {
            return nil
        }
        self.title = dict["article_title"] as? String
        self.summary = dict["article_summary"] as? String
        self.authorName = dict["user_name"] as? String
        self.authorPortraitUrl = dict["user_portraitUrl"] as? String
        self.pubTime = dict["article_pubTime"] as? String
    }
    
    
    static func getDataArray() -> [ArticleModel]? {
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        if let data = try? Data(contentsOf: NSURL.fileURL(withPath: path!)), let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) {
            if let dataDict = json as? [String: Any], let dictArray = dataDict["result"] as? [Dictionary<String, Any>] {
                var dataArray: [ArticleModel] = Array()
                for dict in dictArray {
                    let article = ArticleModel(data: dict)
                    if let article = article {
                        dataArray.append(article)
                    }
                }
                return dataArray
            }
        }
        return nil
    }
}

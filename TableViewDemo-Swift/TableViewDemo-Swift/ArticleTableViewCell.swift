//
//  ArticleTableViewCell.swift
//  TableViewDemo-Swift
//
//  Created by Ssuperjoy on 2018/9/10.
//  Copyright © 2018年 Mr.Zhang. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var articleModel: ArticleModel? {
        didSet {
            titleLabel.text = articleModel?.title
            summaryLabel.text = articleModel?.summary
            authorLabel.text = articleModel?.authorName
            timeLabel.text = articleModel?.pubTime
            if let imgName = articleModel?.authorPortraitUrl {
                portraitImageView.image = UIImage.init(named: imgName)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.portraitImageView.layer.cornerRadius = 9.0
        self.portraitImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

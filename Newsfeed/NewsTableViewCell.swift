//
//  NewsTableViewCell.swift
//  Newsfeed
//
//  Created by David Andreasson on 2018-06-19.
//  Copyright © 2018 David Andreasson. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    var item:RSSItem! {
        didSet {
            let attributedStringForUrl = NSMutableAttributedString(string: "read more")
            attributedStringForUrl.addAttribute(.link, value: item.urlLink, range: NSRange(location: 0, length: attributedStringForUrl.length))
            
            titleLabel.text = item.title
            descriptionLabel.text = item.description
            pubDateLabel.text = item.publicationDate
        }
    }
    
    @IBAction func readMoreButtonPressed(_ sender: Any) {
        if let url = URL(string: item.urlLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

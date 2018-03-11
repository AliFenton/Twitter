//
//  TweetDetailCell.swift
//  twitter_alamofire_demo
//
//  Created by Terra Fenton on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetDetailCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var screenameTextLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    var tweet: Tweet! {
        didSet{
            tweetTextLabel.text = tweet.text
            profileImageView.layer.cornerRadius = 34
            profileImageView.clipsToBounds = true
            profileImageView.af_setImage(withURL: tweet.user.profilePictureUrl)
            usernameTextLabel.text = tweet.user.name
            
            screenameTextLabel.text = tweet.user.screenName
            let df = DateFormatter()
            df.dateStyle = .full
            df.timeStyle = .full
            
            let date = df.date(from: tweet.createdAtString)!
            df.dateStyle = .short
            df.timeStyle = .short
            dateTextLabel.text = df.string(from: date)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

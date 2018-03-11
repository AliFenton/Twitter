//
//  ProfileCell.swift
//  twitter_alamofire_demo
//
//  Created by Terra Fenton on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var bannerImagevIew: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var decsriptionLabel: UILabel!
    @IBOutlet weak var counterTweetsLabel: UILabel!
    @IBOutlet weak var followerCounterLabel: UILabel!
    @IBOutlet weak var followingCounterLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    var user : User! {
        didSet{
            bannerImagevIew.af_setImage(withURL: user.coverPictureUrl)
            profileImageView.af_setImage(withURL: user.profilePictureUrl)
            profileImageView.layer.cornerRadius = 34
            profileImageView.clipsToBounds = true
            usernameLabel.text = user.name
            screenName.text = user.screenName
            decsriptionLabel.text = user.description
            counterTweetsLabel.text = String(user.numberOfTweets)
            followerCounterLabel.text = "\(user.followersCount ?? -1)"
            followingCounterLabel.text = "\(user.followingCount ?? -1)"
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

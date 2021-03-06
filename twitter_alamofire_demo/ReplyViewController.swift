//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by Terra Fenton on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
protocol ReplyViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}
class ReplyViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var closeViewButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    
    weak var delegate: ReplyViewControllerDelegate?
    var tweet: Tweet!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tweetTextView.placeholder = "What's happening?"
        tweetTextView.placeholderColor = UIColor.lightGray // optional
        
//        profileImageView.af_setImage(withURL: (User.current?.profilePictureUrl)!)
//        profileImageView.layer.masksToBounds = false
//        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
//        profileImageView.clipsToBounds = true
        
        tweetTextView.delegate = self
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        counterLabel.text = String(characterLimit - newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func onReply(_ sender: Any) {
        let tweetText = tweetTextView.text
        APIManager.shared.replyTweet(with: tweetText!, with: tweet.idString) { (tweet, error) in
            if let error = error {
                print("Error replying Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Reply Tweet Success!")
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

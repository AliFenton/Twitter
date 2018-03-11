//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Terra Fenton on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import UITextView_Placeholder
protocol ComposeViewControllerDelegate : NSObjectProtocol {
    func did(post: Tweet)
}
class ComposeViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    weak var delegate: ComposeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.placeholder = "What's Happening?"
        tweetTextView.placeholderColor = UIColor.lightGray
        print("Compose image")
        print(User.current?.profilePictureUrl)
        //profileImageView.af_setImage(withURL: (User.current?.profilePictureUrl)!)
        //profileImageView.layer.cornerRadius = 35
        //profileImageView.clipsToBounds = true
   
        tweetTextView.becomeFirstResponder()
        tweetTextView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCompose(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        counterLabel.text = "\(characterLimit - newText.count)"
        // The new text should be allowed? True/False
        return newText.count < characterLimit
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

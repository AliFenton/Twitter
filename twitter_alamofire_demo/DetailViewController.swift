//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Terra Fenton on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tweet: Tweet!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.tableFooterView = UIView(frame: .zero)
        
        detailTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TweetDetailCell", for: indexPath) as! TweetDetailCell
            cell.tweet = tweet
            return cell
        }
        else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountersCell", for: indexPath) as! CountersCell
            cell.tweet = tweet
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionsCell", for: indexPath) as! ActionsCell
            cell.tweet = tweet
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "replySegue" {
            let replyViewController = segue.destination as! ReplyViewController
            replyViewController.tweet = tweet
        }
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

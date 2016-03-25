//
//  SecondViewController.swift
//  SwiftyCompanion
//
//  Created by Elise LIVET on 3/18/16.
//  Copyright © 2016 Elise LIVET. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var loginLabel: UILabel!

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var levelProgressView: UIProgressView!
    
    @IBOutlet weak var skillsTableView: UITableView!
    @IBOutlet weak var projectsTableView: UITableView!
    
    var login:String = ""
    var access_token : String?
    var email : String?
    var phone : String?
    var cursus : NSArray?
    var level : Double? = 0
    var skills : NSArray?
    var projects : NSArray?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = self.login
        emailLabel.text = self.email
        phoneLabel.text = self.phone        
        if (self.level != nil){
           let lvlperc = String(self.level!).componentsSeparatedByString(".")
           levelLabel.text = "level " + lvlperc[0] + " - " + lvlperc[1] + "%"
            levelProgressView.setProgress(Float(lvlperc[1])!/100, animated: true)
         }
        self.skillsTableView.delegate = self;
        self.skillsTableView.dataSource = self;
        self.projectsTableView.delegate = self;
        self.projectsTableView.dataSource = self;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSkills(){
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("numberOfSectionsInTableView")
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableView1: " + "\(skills?.count)")
        if (tableView == skillsTableView){
            return (skills?.count)!
        }
        else {
            return (projects?.count)!
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableView2")
        if (tableView == skillsTableView){
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "SkillsTableViewCell"
            
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SkillsTableViewCell
            
            // Fetches the appropriate skill for the data source layout.
            let skill: NSDictionary = skills![indexPath.row] as! NSDictionary
            
            let lvlperc = String(skill["level"]!).componentsSeparatedByString(".")
            cell.nameLabel.text = String(skill["name"]!)
            cell.levelLabel.text = "level " + lvlperc[0] + " - " + lvlperc[1] + "%"
            cell.percentageProgressView.setProgress(Float(lvlperc[1])!/100, animated: true)
            return cell
        }
        else {
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "ProjectsTableViewCell"
            
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProjectsTableViewCell
            
            // Fetches the appropriate skill for the data source layout.
            let project: NSDictionary = projects![indexPath.row] as! NSDictionary
            
            cell.nameLabel.text = String(project["name"]!)
            return cell
        }
        
    }
    
    
}
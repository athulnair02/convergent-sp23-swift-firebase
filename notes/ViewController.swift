//
//  ViewController.swift
//  notes
//
//  Created by Bongani Mkonto on 11/1/20.
//  Copyright © 2020 au.com.bonganimkonto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postData = [String]()
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!

    // tableview to show a list of posts
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // set firebase db reference
        ref = Database.database().reference()
        
        // retrieve collection posts and listen for changes
        databaseHandle = ref?.child(Config.FIREBASE_COLLECTION).observe(.childAdded, with: { (snapshot) in
            
            // Code to execute when a child node is added to Notes collection
            // take snapshot value and add to postData array
            
            let note = snapshot.value as? String // typecast db value to String value
            
            if let actualNote = note {
                
                // append data to postData array
                self.postData.append(actualNote)
                
                // reload table view to reflect new posts if they are created
                self.tableView.reloadData()
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }

}


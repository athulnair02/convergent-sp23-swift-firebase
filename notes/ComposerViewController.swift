//
//  ComposerViewController.swift
//  notes
//
//  Created by Bongani Mkonto on 11/1/20.
//  Copyright © 2020 au.com.bonganimkonto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposerViewController: UIViewController {
    
    var ref: DatabaseReference!

    // textview for composing
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
    }
    
    // button adds post
    @IBAction func add(_ sender: Any) {
        
        // POST data to Firebase
        createPost()
        // Dismiss popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // button deletes post
    @IBAction func trash(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func createPost(){
        // create collection called Notes
        ref?.child("Notes").childByAutoId().setValue(textView.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

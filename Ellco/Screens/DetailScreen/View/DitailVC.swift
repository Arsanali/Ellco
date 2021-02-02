//
//  DitailVC.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import UIKit

class DitailVC: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    var model: Ticket.BugTracker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = model?.sender.username
        labelName.text = model?.name
        labelDescription.text = model?.description
    }
    
}

//
//  MainCell.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
        
    func settingsCell(model: Ticket.BugTracker){
        nameLabel.text = "\(model.name)"
        descriptionLabel.text = "\(model.description)"
    }
}

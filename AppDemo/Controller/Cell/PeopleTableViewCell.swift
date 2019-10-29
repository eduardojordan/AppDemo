//
//  PeopleTableViewCell.swift
//  AppDemo
//
//  Created by MAC on 29/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func bind(person: Person){
        nameLabel.text = person.name
        occupationLabel.text = person.occupation
        yearsLabel.text = person.years
    }
    
}

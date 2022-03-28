//
//  SearchTableViewCell.swift
//  GithubSearchMVC
//
//  Created by 한지민 on 2022/03/16.
//

import UIKit
import Entity

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    func setData(data: Repository) {
        nameLabel.text = data.full_name
        descriptionLabel.text = data.description
    }
}

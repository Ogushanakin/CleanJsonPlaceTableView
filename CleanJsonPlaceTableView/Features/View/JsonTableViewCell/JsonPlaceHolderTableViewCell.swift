//
//  JsonPlaceHolderTableViewCell.swift
//  CleanJsonPlaceTableView
//
//  Created by AKIN on 26.09.2022.
//

import UIKit

class JsonPlaceHolderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    
    override func awakeFromNib() {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

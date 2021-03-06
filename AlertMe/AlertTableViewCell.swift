//
//  AlertTableViewCell.swift
//  AlertMe
//
//  Created by Lucas Rocali on 6/20/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import UIKit

class AlertTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(event:Event) {
        categoryLbl.text = event.category
        userLbl.text = event.userName
        dateLbl.text = event.date
    }

}

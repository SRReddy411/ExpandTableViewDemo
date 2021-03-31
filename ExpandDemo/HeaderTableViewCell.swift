//
//  HeaderTableViewCell.swift
//  ExpandDemo
//
//  Created by RamiReddy on 20/03/21.
//  Copyright © 2021 RamiReddy. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceName_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setExpanded(){
        
    }
    func setCollapsed(){
        
    }
}

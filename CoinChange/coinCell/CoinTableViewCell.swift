//
//  CoinTableViewCell.swift
//  CoinChange
//
//  Created by User23 on 4/7/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinTypeLabel: UILabel!
    @IBOutlet weak var returnValueLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}

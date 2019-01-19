//
//  HeadlineTableViewCellController.swift
//  PicapPrueba
//
//  Created by Leonel Alfonso on 1/18/19.
//  Copyright © 2019 Leonel Alfonso. All rights reserved.
//

import UIKit

class HeadlineTableViewCellController: UITableViewCell {
    
    @IBOutlet weak var BookingTitle: UILabel!
    
    @IBOutlet weak var PhotoDriver: UIImageView!
    
    @IBOutlet weak var PriceTitle: UILabel!
    
    @IBOutlet weak var AddressTitle: UILabel!
    
    @IBOutlet weak var DriverTitle: UILabel!
    
    @IBOutlet weak var StatusTitle: UILabel!
    
    @IBOutlet weak var statusText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

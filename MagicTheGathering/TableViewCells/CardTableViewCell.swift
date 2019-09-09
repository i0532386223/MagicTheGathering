//
//  CardTableViewCell.swift
//  MagicTheGathering
//
//  Created by Ivan Kramarchuk on 09/09/2019.
//  Copyright © 2019 i0532386223.me. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardText: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

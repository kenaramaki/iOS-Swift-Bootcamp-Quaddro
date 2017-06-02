//
//  Celula.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import UIKit

class Celula: UITableViewCell {

    @IBOutlet weak var labelIdade: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

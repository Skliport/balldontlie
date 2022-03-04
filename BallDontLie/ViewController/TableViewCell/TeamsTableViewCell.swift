//
//  TeamsTableViewCell.swift
//  BallDontLie
//
//  Created by APPLAUDO on 27/2/22.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var division: UILabel!
    @IBOutlet weak var abreviationName: UILabel!
    @IBOutlet weak var city: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

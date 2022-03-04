//
//  PlayerTableViewCell.swift
//  BallDontLie
//
//  Created by APPLAUDO on 27/2/22.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerTeam: UILabel!
    @IBOutlet weak var playerFeet: UILabel!
    @IBOutlet weak var playerHeigth: UILabel!
    @IBOutlet weak var playerWeigth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

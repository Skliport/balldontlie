//
//  GamesTableViewCell.swift
//  BallDontLie
//
//  Created by APPLAUDO on 27/2/22.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var visitorImage: UIImageView!
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    @IBOutlet weak var visitorTeamScore: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

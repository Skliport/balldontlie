//
//  ViewController.swift
//  BallDontLie
//
//  Created by APPLAUDO on 23/2/22.
//

import UIKit
import Combine

class PlayersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var playerViewModel = PlayerViewModel()
    var playerDetail = [PlayerDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkConection()
        configureTableView()
        activityIndicator.hidesWhenStopped = true
    }
    
    func checkConection() {
        if NetworkMonitor.shared.isConected == false {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "You don't have internet conexion, you may see outdated data", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I Understand", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func configureTableView() {
        activityIndicator.startAnimating()
        let nibName = UINib(nibName: "\(PlayerTableViewCell.self)", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "\(PlayerTableViewCell.self)")
        playerViewModel.getAllPlayers{
            self.showCellInfo()
        }
        tableView.allowsSelection = false
        tableView.dataSource = self
    }
    
    func showCellInfo () {
        switch playerViewModel.charactersState {
        case .error(let error):
            print(error)
        case .initial:
            print("Initial")
        case .loading:
            print ("Loading")
        case .loaded(let data):
            if let playerCurrentData = data.data {
                playerDetail = playerCurrentData
            }
            tableView.reloadData()
            activityIndicator.stopAnimating()
        }
    }
}

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(PlayerTableViewCell.self)", for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        let firtName = playerDetail[indexPath.row].first_name
        let secondName = playerDetail[indexPath.row].last_name
        cell.playerName.text = "Name: \(firtName ?? "") \(secondName ?? "")"
        cell.playerPosition.text = "Position: \(playerDetail[indexPath.row].position ?? "No position")"
        cell.playerTeam.text = "Team: \(playerDetail[indexPath.row].team?.name ?? "No team")"
        cell.playerFeet.text = "Feet Height: \( playerDetail[indexPath.row].height_feet ?? 0)"
        cell.playerHeigth.text = "Inches: \( playerDetail[indexPath.row].height_inches ?? 0)"
        cell.playerWeigth.text = "Weight: \( playerDetail[indexPath.row].weight_pounds ?? 0)"
        
        return cell
    }
}

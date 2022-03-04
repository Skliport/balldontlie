//
//  GamesViewController.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import UIKit

class GamesViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var acitvityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var gamesViewModel = GamesViewModel()
    var gamesDetail = [Game]()
    var filteredGameDetail = [Game]()
    var gameViewModel: TeamData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkConection()
        configureTableView()
        acitvityIndicator.hidesWhenStopped = true
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
        acitvityIndicator.startAnimating()
        let nibName = UINib(nibName: "\(GamesTableViewCell.self)", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "\(GamesTableViewCell.self)")
        gamesViewModel.getAllGames{
            self.showCellInfo()
        }
        searchBar.delegate = self
        tableView.allowsSelection = false
        tableView.dataSource = self
    }
    
    func showCellInfo () {
        switch gamesViewModel.gamesState {
        case .error(let error):
            print(error)
        case .initial:
            print("Initial")
        case .loading:
            print ("Loading")
        case .loaded(let data):
            if let gameCurrentData = data.data {
                filteredGameDetail = gameCurrentData.sorted{
                    $0.date! > $1.date!
                }
            }
            tableView.reloadData()
            acitvityIndicator.stopAnimating()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredGameDetail = []
        if searchText == "" {
            filteredGameDetail = gamesDetail
        } else {
            gamesDetail.forEach{ data in
                if let newData = data.home_team?.full_name, newData.contains(searchText){
                    filteredGameDetail.append(data)
                }
            }
        }
        tableView.reloadData()
    }
}

extension GamesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGameDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamesTableViewCell.self)", for: indexPath) as? GamesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.season.text = "\(filteredGameDetail[indexPath.row].season ?? 0)"
        cell.date.text = "\(filteredGameDetail[indexPath.row].date ?? "No date")"
        cell.homeTeamName.text = "\(filteredGameDetail[indexPath.row].home_team?.full_name ?? "No team Name")"
        cell.homeImage.image = UIImage(named: "\(filteredGameDetail[indexPath.row].home_team?.full_name ?? "placeholder").png")
        cell.homeTeamScore.text = "\(filteredGameDetail[indexPath.row].home_team_score ?? 0)"
        cell.visitorTeamName.text = "\(filteredGameDetail[indexPath.row].visitor_team?.full_name ?? "No Team")"
        cell.visitorTeamScore.text = "\(filteredGameDetail[indexPath.row].visitor_team_score ?? 0)"
        cell.visitorImage.image = UIImage(named: "\(filteredGameDetail[indexPath.row].visitor_team?.full_name ?? "placeholder").png")
        cell.status.text = "\(filteredGameDetail[indexPath.row].status ?? "No status")"
        
        return cell
        
    }
}


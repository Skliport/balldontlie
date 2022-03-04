//
//  TeamViewController.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import UIKit

class TeamViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var acticityIndicator: UIActivityIndicatorView!
    
    var teamsViewModel = TeamsViewModel()
    var teamDetail = [Team]()
    var teamFiltered = [Team]()
    
    @IBAction func SegmentedConference(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
           teamFiltered = teamDetail.filter({ (conference) in
                return conference.conference == "East"
            })
            tableView.reloadData()
        } else {
            teamFiltered = teamDetail.filter({ (conference) in
                 return conference.conference == "West"
             })
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        checkConection()
        configureTableView()
        acticityIndicator.hidesWhenStopped = true
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
        acticityIndicator.startAnimating()
        let nibName = UINib(nibName: "\(TeamsTableViewCell.self)", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "\(TeamsTableViewCell.self)")
        teamsViewModel.getAllTeams{
            self.showCellInfo()
        }
        tableView.allowsSelection = false
        tableView.dataSource = self
    }
    
    func showCellInfo () {
        switch teamsViewModel.teamState {
        case .error(let error):
            print(error)
        case .initial:
            print("Initial")
        case .loading:
            print ("Loading")
        case .loaded(let data):
            if let teamCurrentData = data.data {
                teamDetail = teamCurrentData
                teamFiltered = teamDetail.filter({ (conference) in
                    return conference.conference == "East"
                })
            }
            tableView.reloadData()
            acticityIndicator.stopAnimating()
        }
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TeamsTableViewCell.self)", for: indexPath) as? TeamsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.teamLogo.image = UIImage(named: "\(teamFiltered[indexPath.row].full_name ?? "placeholder").png")
        cell.teamName.text = "\(teamFiltered[indexPath.row].full_name ?? "No team")"
        cell.abreviationName.text = "Abbreviation: \(teamFiltered[indexPath.row].abbreviation ?? "No Abb")"
        cell.division.text = "Division: \(teamFiltered[indexPath.row].division ?? "No division")"
        cell.city.text = "City: \(teamFiltered[indexPath.row].city ?? "No City")"

        return cell
    }
}

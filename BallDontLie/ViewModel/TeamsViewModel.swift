//
//  TeamsViewController.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation
import Combine

class TeamsViewModel: ObservableObject {
    
    @Published var teamState:TeamViewModelState=TeamViewModelState.initial
    
    let DataService: Service = Service()
    var cancellable = Set<AnyCancellable>()
    
    func getAllTeams(_ completed: @escaping () -> ()){
        teamState = TeamViewModelState.loading
        DataService.getAllTeams()
            .sink { [weak self] completion in
                switch completion{
                case .finished:
                    completed()
                case .failure(let error):
                    self?.teamState=TeamViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Teams in
                self?.teamState=TeamViewModelState.loaded(teamModel: Teams)
            }
            .store(in: &cancellable)
    }
    
}

//
//  GamesViewModel.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation
import Combine

class GamesViewModel: ObservableObject {
    
    @Published var gamesState:GamesViewModelState = GamesViewModelState.initial
    
    let DataService: Service = Service()
    var cancellable = Set<AnyCancellable>()
    
    func getAllGames(_ completed: @escaping () -> ()){
        gamesState = GamesViewModelState.loading
        DataService.getAllGames()
            .sink { [weak self] completion in
                switch completion{
                case .finished:
                    completed()
                case .failure(let error):
                    self?.gamesState = GamesViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Games in
                self?.gamesState = GamesViewModelState.loaded(gameModel: Games)
            }
            .store(in: &cancellable)
    }
    
}

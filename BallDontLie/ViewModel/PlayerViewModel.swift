//
//  PlayerViewModel.swift
//  BallDontLie
//
//  Created by APPLAUDO on 23/2/22.
//

import Foundation
import Combine

class PlayerViewModel: ObservableObject {
    
    @Published var charactersState:CharacterViewModelState=CharacterViewModelState.initial
    
    let DataService: Service=Service()
    var cancellable = Set<AnyCancellable>()
    
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters(){
        charactersState=CharacterViewModelState.loading
        DataService.getAllPlayers()
            .sink { [weak self] completion in
                switch completion{
                    
                case .finished:
                    print("finish")
                case .failure(let error):
                    self?.charactersState=CharacterViewModelState.error(errorMessage: "\(error)")
                }
            } receiveValue: { [weak self] Characters in
                self?.charactersState=CharacterViewModelState.loaded(userModel: Characters)
            }
            .store(in: &cancellable)
    }
    
}


//
//  Service.swift
//  BallDontLie
//
//  Created by APPLAUDO on 23/2/22.
//

import Foundation
import Combine

class Service: ServiceManager{
    
    func getAllPlayers() -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "\(Constants.baseURL)\(Constants.players)\(Constants.parameter)")!)
            .map({$0.data})
            .decode(type: Data.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAllGames() -> AnyPublisher<GameData, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "\(Constants.baseURL)\(Constants.games)\(Constants.parameter)")!)
            .map({$0.data})
            .decode(type: GameData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAllTeams() -> AnyPublisher<TeamData, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "\(Constants.baseURL)\(Constants.teams)")!)
            .map({$0.data})
            .decode(type: TeamData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

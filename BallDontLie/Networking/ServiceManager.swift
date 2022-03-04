//
//  ServiceManager.swift
//  BallDontLie
//
//  Created by APPLAUDO on 26/2/22.
//

import Foundation
import Combine

protocol ServiceManager {
    func getAllPlayers() -> AnyPublisher<Data, Error>
    func getAllGames() -> AnyPublisher<GameData, Error>
    func getAllTeams() -> AnyPublisher<TeamData, Error>
}

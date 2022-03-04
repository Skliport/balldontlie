//
//  Games.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

enum GamesViewModelState {
    case initial
    case loading
    case loaded(gameModel: GameData)
    case error(errorMessage: String)
}

struct GameData: Decodable, Hashable {
    let data: [Game]?
}

struct Game: Decodable, Hashable {
    let id: Int?
    let date: String?
    let home_team_score: Int?
    let visitor_team_score: Int?
    let season: Int?
    let period: Int?
    let status: String?
    let time: String?
    let postseason: Bool?
    let home_team: HomeTeam?
    let visitor_team: VisitorTeam?
}

struct HomeTeam: Decodable, Hashable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

struct VisitorTeam: Decodable, Hashable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

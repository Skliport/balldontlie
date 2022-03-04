//
//  Players.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

enum CharacterViewModelState {
    case initial
    case loading
    case loaded(userModel:Data)
    case error(errorMessage:String)
}

struct Data: Decodable, Hashable {
    let data: [PlayerDetails]?
}

struct PlayerDetails: Decodable, Hashable {
    let id: Int?
    let first_name: String?
    let last_name: String?
    let position: String?
    let height_feet: Int?
    let height_inches: Int?
    let weight_pounds: Int?
    let team: Team2?
}

struct Team2: Decodable, Hashable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

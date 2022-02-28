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
    let player: [PlayerDetails]?
}

struct PlayerDetails: Decodable, Hashable {
    let id: Int?
    let first_name: String?
    let last_name: String?
    let position: String?
    let height_feet: Int?
    let heigth_inches: Int?
    let weight_pounds: Int?
    let team: Team?
}

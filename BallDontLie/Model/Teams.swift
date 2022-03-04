//
//  Teams.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

enum TeamViewModelState {
    case initial
    case loading
    case loaded(teamModel: TeamData)
    case error(errorMessage: String)
}

struct TeamData: Decodable, Hashable {
    let data: [Team]?
}

struct Team: Decodable, Hashable {
    let id: Int?
    let abbreviation: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

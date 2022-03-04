//
//  Constants.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

enum Constants {
    static let baseURL: String = "https://www.balldontlie.io/api/v1/"
    static let players: String = "players?page="
    static let teams: String = "teams"
    static let games: String = "games?page="
    static let parameter: String = "0"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

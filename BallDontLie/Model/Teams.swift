//
//  Teams.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

struct Team: Decodable, Hashable {
    let id: Int?
    let first_name: String?
    let city: String?
    let conference: String?
    let division: String?
    let full_name: String?
    let name: String?
}

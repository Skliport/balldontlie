//
//  Meta.swift
//  BallDontLie
//
//  Created by APPLAUDO on 24/2/22.
//

import Foundation

struct Meta: Decodable, Hashable {
    let total_pages: Int
    let current_page: Int
    let next_page: Int
    let per_page: Int
    let total_count: Int
}

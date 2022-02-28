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
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/players?page=0")!)
            .map({$0.data})
            .decode(type: Data.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

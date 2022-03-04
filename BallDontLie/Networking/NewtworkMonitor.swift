//
//  NewtworkMonitor.swift
//  BallDontLie
//
//  Created by APPLAUDO on 26/3/22.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public var isConected: Bool = false
    public var conectionType: ConectionType = .unknown
    
    enum ConectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConected = path.status == .satisfied
            self?.getConnectionType(path)
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
    func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            conectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
            conectionType = .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            conectionType = .ethernet
        } else {
            conectionType = .unknown
        }
    }
}

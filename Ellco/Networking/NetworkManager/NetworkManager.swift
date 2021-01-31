//
//  NetworkMabager.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation


protocol NetworkManager {
    func getData(completion: @escaping (Result <Ticket , Error>) -> Void)
}

class NetworkManagerImp: NetworkManager {
    
    func getData(completion: @escaping (Result<Ticket, Error>) -> Void) {
        <#code#>
    }
}

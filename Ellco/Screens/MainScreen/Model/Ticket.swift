//
//  Ticket.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation

struct Ticket:Decodable {
    let name: String
    let description: String
    let sender: [Sender]
}

struct Sender: Decodable {
    let id: Int
    let username: String
}


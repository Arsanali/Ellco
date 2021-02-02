//
//  Ticket.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation

struct Ticket: Decodable {
    let bugTrackers: [BugTracker]
    let bugTrackersCount, totalPages, currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case bugTrackers = "bug_trackers"
        case bugTrackersCount = "bug_trackers_count"
        case totalPages, currentPage
    }

    struct BugTracker: Decodable {
        let id: Int
        let description: String
        let name: String
        let sender: Sender
        
        struct Sender: Decodable {
            let username: String
        }

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case description = "description"
            case name = "name"
            case sender = "sender"
        }
    }
    
    

}





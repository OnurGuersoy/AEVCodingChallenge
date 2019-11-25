//
//  Post.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation


struct Post: Codable, Identifiable, Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }

    let id: String
    let timestamp: String
    let service: Service
    let user: User
    let message: String
    let content: [PostContent]
}

//
//  File.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation

struct Posts: Codable {
    let total: Int
    let posts: [Post]
}

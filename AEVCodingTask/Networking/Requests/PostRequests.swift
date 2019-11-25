//
//  GetNextPostsRequest.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation

enum PostRequests: Request {
    case nextPosts(pageLimit: String, pageOffset: String)

    var path: String {
        switch self {
        case .nextPosts(pageLimit: _, pageOffset: _):
            return "/v1/community/v1/posts"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .nextPosts(pageLimit: _, pageOffset: _):
            return .GET
        }
    }

    var parameters: RequestParams {
        switch self {
        case .nextPosts(let pageLimit, let pageOffset):
            return .url(["page.limit": pageLimit, "page.offset": pageOffset])
        }
    }

    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }

    var dataType: DataType {
        switch self {
        case .nextPosts(pageLimit: _, pageOffset: _):
            return .Data
        }
    }
}

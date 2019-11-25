//
//  GetNextPostsOperation.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation
import os.log


class GetNextPostsOperation: Operation {
    typealias OutPut = Posts?

    var pageLimit: String
    var pageOffset: String

    init(pageLimit: Int, pageOffset: Int) {
        self.pageLimit = String(pageLimit)
        self.pageOffset = String(pageOffset)
    }

    var request: Request {
        return PostRequests.nextPosts(pageLimit: pageLimit, pageOffset: pageOffset)
    }

    func execute(in dispatcher: Dispatcher, completion: @escaping (Posts?) -> Void) {
        do {
            try dispatcher.execute(request: request) { response in
                switch response {
                case .data(let data):
                    do {
                        let posts = try JSONDecoder().decode(Posts.self, from: data)
                        completion(posts)
                    } catch {
                        print(error)
                    }
                case .error(let code, let error):
                    completion(nil)
                    print(code ?? 0)
                    print(error?.localizedDescription ?? "No Descricption")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

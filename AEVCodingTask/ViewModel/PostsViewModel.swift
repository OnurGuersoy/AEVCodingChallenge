//
//  PostsViewModel.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = [Post]()
    @Published var showActivityIndicator: Bool = false
    @Published var showErrorMessage: Bool = false
    private var getPostResponse: Posts?
    let alertErrorMessage: String = "Die angeforderten Daten koennen leider nicht angezeigt werden"

    private let dispatcher: Dispatcher
    private let pageLimit: Int = 5
    private var pageOffset: Int = 0

    init(with dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        getPosts()
    }

    private func getPosts() {
        self.showActivityIndicator = true
        GetNextPostsOperation(pageLimit: pageLimit, pageOffset: pageOffset).execute(in: dispatcher) { posts in
            DispatchQueue.main.async {
                self.getPostResponse = posts
                self.pageOffset += self.pageLimit
                self.showActivityIndicator = false
                if let savePosts = posts?.posts {
                    self.posts.append(contentsOf: savePosts)
                } else {
                    self.showErrorMessage = true
                }
            }
        }
    }

    func reloadItemsOnAppear(post: Post) {
        if let lastPost = self.posts.last, post == lastPost, getPostResponse?.total != posts.count  {
            self.getPosts()
        }
    }
}

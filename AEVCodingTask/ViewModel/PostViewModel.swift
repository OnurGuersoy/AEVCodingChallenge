//
//  PostViewModel.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 27.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation
import SwiftUI

class PostViewModel {
    @Published var post: Post
    @Published var postImageData: Data?
    @Published var userImageData: Data?

    init(with post: Post) {
        self.post = post
        fetchPostImage(from: URL(string: post.content.first?.media.url ?? ""))
        fetchUserImage(from: URL(string: post.user.image_url))
    }

    func fetchPostImage(from url: URL?) {
        if let saveHttpUrl = url {
            var components = URLComponents(url: saveHttpUrl, resolvingAgainstBaseURL: false)
            components?.scheme = "https"
            let httpsURL = components?.url
            if let saveUrl = httpsURL {
                getDataFrom(imageUrl: saveUrl) { data in
                    DispatchQueue.main.async {
                        self.postImageData = data
                    }
                }
            }
        }
    }

    func fetchUserImage(from url: URL?) {
        if let saveHttpUrl = url {
            var components = URLComponents(url: saveHttpUrl, resolvingAgainstBaseURL: false)
            components?.scheme = "https"
            let httpsURL = components?.url
            if let saveUrl = httpsURL {
                getDataFrom(imageUrl: saveUrl) { data in
                    DispatchQueue.main.async {
                        self.userImageData = data
                    }
                }
            }
        }
    }
    
    private func getDataFrom(imageUrl: URL, completion: @escaping (Data) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: imageUrl)
                completion(data)
            } catch {
                print("Fetching image didn't work. Stoppped with message: \(error)")
            }
        }
    }
}

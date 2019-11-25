//
//  ImageView.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import SwiftUI

extension Image {
    public init(from url: URL?) {
        do {
            if let saveHttpUrl = url {
                var components = URLComponents(url: saveHttpUrl, resolvingAgainstBaseURL: false)
                components?.scheme = "https"
                let httpsURL = components?.url
                if let saveUrl = httpsURL {
                    let data = try Data(contentsOf: saveUrl)
                    let uiImage = UIImage(data: data)
                    if let image = uiImage {
                        self.init(uiImage: image)
                        return
                    }
                }
            }
        } catch {
            print("Fetching image didn't work. Stoppped with message: \(error)")
        }
        self.init(systemName: "photo.fill")
    }
}

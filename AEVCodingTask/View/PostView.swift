//
//  PostView.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import SwiftUI

struct PostView: View {
    let post: Post

    var body: some View {
        HStack {
            VStack {
                Image(from: URL(string: post.user.image_url))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(30)
                    .padding()
                Text(post.user.name)
            }
            Spacer()
            VStack {
                Text(post.message)
                Image(from: URL(string: post.content.first?.media.url ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}

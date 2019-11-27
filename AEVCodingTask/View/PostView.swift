//
//  PostView.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import SwiftUI

struct PostView: View {
    let viewModel: PostViewModel

    var body: some View {
        HStack {
            VStack {
                viewModel.userImageData != nil ?
                    Image(uiImage: UIImage(data: viewModel.userImageData!) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50.0, height: 50.0, alignment: .center)
                        .cornerRadius(30.0)
                        .padding()
                    :
                    Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50.0, height: 50.0, alignment: .center)
                    .cornerRadius(30.0)
                    .padding()
                Text(viewModel.post.user.name)
            }
            Spacer()
            VStack {
                Text(viewModel.post.message)
                viewModel.postImageData != nil ?
                    Image(uiImage: UIImage(data: viewModel.postImageData!) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(30)
                    .padding()
                    :
                    Image(systemName: "photo.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(30)
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

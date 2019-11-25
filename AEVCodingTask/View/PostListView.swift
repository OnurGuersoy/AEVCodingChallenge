//
//  ContentView.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostsViewModel

    var body: some View {
        NavigationView {
            ZStack {
                List (viewModel.posts, id: \.id) { post in
                    PostView(post: post)
                    .onAppear {
                        self.viewModel.reloadItemsOnAppear(post: post)
                    }
                }
                    .listStyle(GroupedListStyle())
                    .background(Color.black)
                    .navigationBarTitle("AEV Posts")
                ActivityIndicator(isAnimating: $viewModel.showActivityIndicator, style: .large)
                    .opacity(viewModel.showActivityIndicator ? 1 : 0)
            }
            .alert(isPresented: $viewModel.showErrorMessage) {
                Alert(title: Text("Fehler"), message: Text(viewModel.alertErrorMessage), dismissButton: .cancel())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(viewModel: PostsViewModel(with: CodingTaskDispatcher(environment: Environment(name: "MainEnvironment"))))
    }
}

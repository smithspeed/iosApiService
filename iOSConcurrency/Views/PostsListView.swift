//
//  PostsListView.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 09/08/22.
//

import SwiftUI

struct PostsListView: View {
    
    @StateObject var vm = PostsListViewModel()
    
    var userId: Int?
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(vm.posts) {
                    post in VStack(alignment: .leading){
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.callout)
                            .foregroundColor(.secondary)
                        
                        
                    }
                }
            }
        }
        .overlay(content: {
            if vm.isLoading {
                ProgressView()
            }
        })
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK"){}
        }, message: {
            
            if let errorMessage = vm.errorMessage{
                Text(errorMessage)
            }
            
        })
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        .onAppear {
            vm.userId = userId
            vm.fetchPosts()
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostsListView(userId: 1)
        }
        
    }
}

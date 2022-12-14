//
//  UsersListView.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 08/08/22.
//

import SwiftUI

struct UsersListView: View {
    
    @StateObject var vm = UsersListViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(vm.users) { user in
                    
                    NavigationLink{
                        PostsListView(userId: user.id)
                    } label: {
                        VStack(alignment: .leading){
                            
                            Text(user.name)
                                .font(.title)
                            Text(user.email)
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
                
                if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                }
            })
            .navigationTitle("Users")
            .listStyle(.plain)
            .task {
                await vm.fetchUsers()
            }
//            .onAppear{
//                //vm.fetchUsers() // for sync
//
//                //For async operation
//                Task{
//                   await vm.fetchUsers()
//                }
//            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
            .previewInterfaceOrientation(.portrait)
    }
}

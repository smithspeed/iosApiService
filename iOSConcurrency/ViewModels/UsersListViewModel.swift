//
//  UsersListViewModel.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 08/08/22.
//

import Foundation

class UsersListViewModel : ObservableObject {
    
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    func fetchUsers() {
        
        //Call API Service to get user list
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        isLoading.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            apiService.getJSON { (result: Result<[User], APIError>) in
                
                defer{
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
                
                switch result {
                case .success(let users):
                    DispatchQueue.main.async {
                        
                        self.users = users
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showAlert = true
                        self.errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
                    }
                }
            }
        }
        
    }
}

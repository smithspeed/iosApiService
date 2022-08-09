//
//  User.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 08/08/22.
//

import Foundation

struct User: Codable, Identifiable {
    
    let id: Int
    let name: String
    let username: String
    let email: String
}

//
//  Post.swift
//  iOSConcurrency
//
//  Created by Dhananjay Kumar on 08/08/22.
//

import Foundation

struct Post: Codable, Identifiable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

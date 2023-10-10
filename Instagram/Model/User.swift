//
//  User.swift
//  Instagram
//
//  Created by ROCIO CHAN on 26/09/23.
//

import Foundation

struct User: Identifiable {
    
    var id = UUID()
    var userName: String
    var userImage: String
}

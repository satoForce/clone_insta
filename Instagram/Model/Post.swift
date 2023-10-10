//
//  Post.swift
//  Instagram
//
//  Created by ROCIO CHAN on 29/09/23.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let user: User
    let postImage: String
    let caption: String
    let likes: String
    let hasLiked: Bool = false
    let hasBookmarked: Bool = false
}

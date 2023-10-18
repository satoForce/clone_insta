//
//  StoryViewDataApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 15/10/23.
//

import Foundation

struct APIData: Decodable {
    let results: [Characters]
}

struct Characters: Decodable {
    let name: String
    let image: String
}



//
//  Search.swift
//  Instagram
//
//  Created by ROCIO CHAN on 20/10/23.
//

import Foundation

public struct Search {
    let name: String
    let image: String
    let species: String
    let gender: String
    
    init(response: APIData) {
        name = response.results.first?.name ?? ""
        image = response.results.first?.image ?? ""
        species = response.results.first?.species ?? ""
        gender = response.results.first?.gender ?? ""
    }
}

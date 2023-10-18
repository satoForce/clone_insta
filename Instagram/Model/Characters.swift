//
//  Characters.swift
//  Instagram
//
//  Created by ROCIO CHAN on 16/10/23.
//

import Foundation

public struct Characters {
    let name: String
    let image: String
  
    
    init(response: ApiData) {
        name = response.characters.first?.name ?? ""
        image = response.characters.first?.image ?? ""
    }
}

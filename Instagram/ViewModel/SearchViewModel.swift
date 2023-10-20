//
//  SearchViewModel.swift
//  Instagram
//
//  Created by ROCIO CHAN on 20/10/23.
//

//import Foundation
//
//class SearchViewModel: ObservableObject {
//    @Published var characterName: String = "Character Name"
//    @Published var characterImage: String = "--"
//    @Published var characterSpecie: String = "--"
//    @Published var characterGender: String = "--"
//    
//    public let searchVM: ViewModel
//    
//    init(searchVM: ViewModel) {
//        self.searchVM = searchVM
//    }
//    
//    func refresh() {
//        searchVM.loadData { character in
//            DispatchQueue.main.async {
//                self.characterName = character.name
//                self.characterImage = character.image
//                self.characterSpecie = character.species
//                self.characterGender = character.gender
//            }
//        }
//    }
//}
//

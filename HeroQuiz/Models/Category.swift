//
//  Category.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import Foundation


struct Category : Identifiable , Hashable{
    var id = UUID()
    let imageLink : String
    let title : String
    let index : Int
    init(id: UUID = UUID(), imageLink: String, title: String, index : Int) {
        self.id = id
        self.imageLink = imageLink
        self.title = title
        self.index = index
    }
}

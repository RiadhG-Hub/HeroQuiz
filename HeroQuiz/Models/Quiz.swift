//
//  Quiz.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation


import Foundation

// MARK: - Root
struct Quiz : Codable , Identifiable {
    var id = UUID()
    let responseCode: Int
    let results: [Question]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}



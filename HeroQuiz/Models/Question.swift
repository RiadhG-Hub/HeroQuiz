//
//  Question.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation


// MARK: - QuizQuestion
struct Question: Codable  , Identifiable , Hashable {
    var id = UUID()
    
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

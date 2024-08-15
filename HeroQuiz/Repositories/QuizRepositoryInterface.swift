//
//  QuizRepositoryInterface.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation

protocol QuizRepositoryInterface {
     
    var questionCount : Int { get set }
    func fetchRandomly() async throws -> Quiz
    func fetchByCategory(category : String)async throws -> Quiz
    func fetchByDifficulty(difficulty : String)async throws -> Quiz
    func fetchByType(type : String)async throws -> Quiz
   
     
}

//
//  QuizRemoteRepository.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation

struct QuizRemoteRepository  {
    
    var questionCount: Int = 10
    
    
    
    func fetchByCategory(categoryIndex: Int) async throws -> Data {
        let urlString = endPoint(category: categoryIndex )
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dataResult : String = String(data : data, encoding: .utf8)!
        
        return data
    }
    
    func fetchByDifficulty(difficulty: String) async throws -> Quiz {
        let urlString = endPoint(difficulty: difficulty)
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let quizResponse = try JSONDecoder().decode(Quiz.self, from: data)
            return quizResponse
        } catch let decodeError {
            throw decodeError
        }
    }
    
    func fetchByType(type: String) async throws -> Quiz {
        let urlString = endPoint(type: type)
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let quizResponse = try JSONDecoder().decode(Quiz.self, from: data)
            return quizResponse
        } catch let decodeError {
            throw decodeError
        }
    }
    
    
    
    
    
    func fetchRandomly() async throws -> Data {
        let urlString = endPoint()
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data 
        
       // do {
            //let quizResponse = try JSONDecoder().decode(Quiz.self, from: data)
        //    return quizResponse
        // } catch let decodeError {
        //  throw decodeError
        // }
    }
    
    
    private  func endPoint(category: Int? = nil, difficulty: String? = nil, type: String? = nil) -> String {
        let baseURL = "https://opentdb.com/api.php"
        var urlComponents = "\(baseURL)?amount=\(questionCount)"
        
        if let category = category {
            urlComponents += "&category=\(category)"
        }
        
        if let difficulty = difficulty {
            urlComponents += "&difficulty=\(difficulty)"
        }
        
        if let type = type {
            urlComponents += "&type=\(type)"
        }
        
        return urlComponents
    }
    
}








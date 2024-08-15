//
//  TestTempPage.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import SwiftUI

struct TestTempPage: View {
    @StateObject private var quizListViewModel = QuizListViewModel()
    @State private var selectedQuiz: Quiz? // This is an optional Quiz

    var body: some View {
        VStack {
           
          

            Text(quizListViewModel.quizResult?.results.first?.type ?? "nil")
            
            Button(action: {
                Task {
                    let quizRemoteRepos = QuizRemoteRepository()
                    let quizCachedRepos = QuizCachedRepository()
                    let quizRepos = QuizRepository(remoteRepository: quizRemoteRepos, cachedRepository: quizCachedRepos, questionCount: 10)
                    
                    do {
                        if let firstCategory = QuizRepository.questionCategory.first {
                            let result = try await quizRepos.fetchCachedQuiz(category: firstCategory)
                            selectedQuiz = result // Assign the result to selectedQuiz
                        }
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }) {
                Text("do http request")
            }
        }
    }
}



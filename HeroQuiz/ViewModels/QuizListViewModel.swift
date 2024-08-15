//
//  QuizListViewModel.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation
import Combine
class QuizListViewModel : ObservableObject {
    let quizRepos : QuizRepository  = QuizRepository(remoteRepository: QuizRemoteRepository(),
                                                     cachedRepository: QuizCachedRepository(),
                                                     questionCount: 10)
    @Published var quizResult : Quiz?
    private var cancellables = Set<AnyCancellable>()
    
    init(quizResult: Quiz? = nil)   {
        self.quizResult = quizResult
        
        Task{
            try   await fetchCachedQuiz(category: QuizRepository.questionCategory.first!)
        }
        
    }
    
    
    @MainActor
    func fetchCachedQuiz(category : Category) async throws  {
        
        QuizCachedRepository.fileName = category.title
        print(QuizCachedRepository.fileName)
        let result = try?  await  quizRepos.fetchCachedQuiz(category: category)
        quizResult = result
        
    }
    
    
    
    
    
}

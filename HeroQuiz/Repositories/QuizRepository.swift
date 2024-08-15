//
//  QuizRepository.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation


struct QuizRepository {
    static let questionCategory : [Category] = [
        Category(imageLink: AssetsLinks.animals, title: "Animals", index: 27),
        Category(imageLink: AssetsLinks.geography, title: "Geography", index: 22),
        Category(imageLink: AssetsLinks.history, title: "History", index: 23),
        Category(imageLink: AssetsLinks.sports, title: "Sports", index: 21)]
    var  questionCount: Int = 10
    static let isCacheDataAvailable : Bool = false
    static let isInternetConnectionAvailable : Bool = false
    
    let remoteRepository : QuizRemoteRepository
    var cachedRepository : QuizCachedRepository
    
    
    init(remoteRepository: QuizRemoteRepository,
         cachedRepository: QuizCachedRepository,
         questionCount: Int) {
        self.remoteRepository = remoteRepository
        self.cachedRepository = cachedRepository
        self.questionCount = questionCount
    }
    
    
    func intRandomdData() async throws {
        if cachedRepository.fileExists(){
            print("data already initialized")
        }else {
            let randomDataResult = try await remoteRepository.fetchRandomly()
            cachedRepository.saveData(randomDataResult)
        }
        
    }
    
    func initCategory() async throws {
        //   if cachedRepository.fileExists(){
        //  print("data already initialized")
        //  }else {
        for category in QuizRepository.questionCategory {
            do {
                let randomDataResult = try await remoteRepository.fetchByCategory(categoryIndex: category.index)
                //change the file name usnig static
                QuizCachedRepository.fileName = category.title
                cachedRepository.saveData(randomDataResult)
            }catch {
                print("something wrong.")
                print(error)
            }
        }
        
        
      
        
        // }
        
    }
    
    
    
    
    func fetchCachedQuiz(category : Category) async throws -> Quiz? {
        
            QuizCachedRepository.fileName = category.title
        print(QuizCachedRepository.fileName)
           let result = try?  await  cachedRepository.fetchCachedQuiz()
           
            return result
        
    }
    
    
    
    
}

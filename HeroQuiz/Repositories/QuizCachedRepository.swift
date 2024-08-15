import Foundation

struct QuizCachedRepository {
    static var   fileName : String = "HeroQuizCacheFile"
    
    
    private let fileManager = FileManager.default
    
    private var cacheDirectory: URL? {
        return fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
    }
    
    private var fileURL: URL? {
        return cacheDirectory?.appendingPathComponent(QuizCachedRepository.fileName)
    }
    
    // Check if the cache file exists
    func fileExists() -> Bool {
        guard let fileURL = fileURL else {
            return false
        }
        return fileManager.fileExists(atPath: fileURL.path)
    }
    
    // Save data to the cache
    func saveData(_ data: Data) {
        guard let fileURL = fileURL else {
            print("Error: Cache directory not found.")
            return
        }
        
        do {
            
            try data.write(to: fileURL,options: .atomic)
            print("Data saved to file is ")
            let jsonString : String? = String(data : data , encoding: .utf8)
            print(jsonString ?? "nill")
           
        } catch {
            print("Error saving data to cache: \(error.localizedDescription)")
        }
    }
    
    // Fetch data from the cache
    func fetchCachedQuiz() async throws -> Quiz? {
        guard let fileURL = fileURL else {
            print("Error: Cache directory not found.")
            return nil
        }
        
        do {
            let data : Data = try Data(contentsOf: fileURL)
            let jsonString = String(data: data, encoding: .utf8)
            
            let quiz = try JSONDecoder().decode(Quiz.self, from: data)
            return quiz
        } catch {
            print("Error loading or decoding cached data: \(error.localizedDescription)")
            return nil
        }
    }
    
    var questionCount: Int = 10
}

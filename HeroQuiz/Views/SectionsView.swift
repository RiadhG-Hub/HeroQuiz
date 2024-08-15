//
//  SectionsView.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import SwiftUI

struct SectionsView: View {
    var questions : [Question] = []
   
        
        // Define the grid layout with fixed-size columns
        let columns = [
            GridItem(.fixed(100)),
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(questions, id: \.self) { item in
                        Text(item.category)
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
#Preview {
    SectionsView(questions: [Question(type: "example", difficulty: "exmaple", category: "example", question: "example", correctAnswer: "example", incorrectAnswers: ["example"])])
}

//
//  CategoryView.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import SwiftUI

struct CategoryView: View {
    var questions : [Category] = []
   
        
        // Define the grid layout with fixed-size columns
        let columns = [
            GridItem(.fixed(100)),
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]
        
    fileprivate func cardItem(_ item: Category) -> some View {
        return Button(action : {
            print(item.title)
        }){
            VStack {
                Image(item.imageLink).resizable().aspectRatio(contentMode: .fit)
                Text(item.title)
                   
            }
        }.frame(width: 100, height: 100)
            .background(Color.gray.opacity( 0.1))
            .foregroundColor(.black)
        .cornerRadius(10)
    }
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(questions, id: \.self) { item in
                        cardItem(item)
                    }
                }
                .padding()
            }
        }
    }
#Preview {
    CategoryView(questions: QuizRepository.questionCategory)
}

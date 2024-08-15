//
//  SplashView.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Image(AssetsLinks.appIconIntern)
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fill)
            
            VStack{
                ProgressView()
                Text("Loading...")
            }.padding().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .background()
        }
    }
}

#Preview {
    SplashView()
}

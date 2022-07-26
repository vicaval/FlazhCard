//
//  OnboardingContentView.swift
//  flazhcard
//
//  Created by vica valencia on 21/07/22.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    
    var imageName: String
    var title: String
    var content: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text(title)
                    .font(.custom("Poppins-Bold", size: 41))
                
                Text(content)
                    .font(.custom("Poppins-Regular", size: 18))
                    .lineSpacing(5)
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            OnboardingContainerView().preferredColorScheme(.light)
//            OnboardingContainerView().preferredColorScheme(.dark)
//        }
//    }
//}

//
//  CardCategoryContainerView.swift
//  flazhcard
//
//  Created by vica valencia on 27/07/22.
//

import SwiftUI

struct CardCategoryContainerView: View {
    
    var categoryName: String
    var flazhcardCount: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(height: 80.0)
            
            VStack(alignment: .leading)  {
                Text(categoryName)
                    .font(.custom("Poppins-Bold", size: 18))
                    .multilineTextAlignment(.leading)
                
                
                Text("\(flazhcardCount) FlazhCards")
                    .font(.custom("Poppins-Regular", size: 16))
            }
            .padding(.leading, 20.0)
        }
    }
}


struct CardCategoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardCategoryContainerView(categoryName: "Design", flazhcardCount: 5)
    }
}

//
//  FlazhCardContainerView.swift
//  flazhcard
//
//  Created by vica valencia on 27/07/22.
//

import SwiftUI

struct FlazhCardNotesContainerView: View {
    
    var flazhcardName: String
    var flazhcardDescription: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(height: 80.0)
            
            VStack(alignment: .leading)  {
                
                Text(flazhcardName)
                    .font(.custom("Poppins-Bold", size: 18))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                Text(flazhcardDescription)
                    .font(.custom("Poppins-Regular", size: 16))
                    .lineLimit(1)
            }
            .padding(.horizontal, 20.0)
        }
    }
}

struct FlazhCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        FlazhCardNotesContainerView(flazhcardName: "The Use of Accessibility", flazhcardDescription: "Lorem Ipsum")
            .previewLayout(.sizeThatFits)
    }
}

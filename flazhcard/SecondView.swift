//
//  SecondView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showView = false
    
    var body: some View {
        
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            
            Text("This is the second one")
                .font(.title2.weight(.heavy))
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

//
//  FirstView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct FirstView: View {
    
    @State var showView = false
    
    var body: some View {
        ZStack {
                   Color.green.ignoresSafeArea()
                   
                   Button {
                       showView.toggle()
                   } label: {
                       Text("Nyoba")
                           .font(.title2)
                           .padding()
                           .padding(.horizontal)
                   }
                   .buttonStyle(.borderedProminent)
              
                   .sheet(isPresented: $showView) {
                       SecondView()
                   }
               }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

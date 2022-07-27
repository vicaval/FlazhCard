//
//  StartView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI


struct notesCategoryDetailsView: View {
    
    @State var showView = false
    
//    // Dummy Category Data
//    var flazhcardnotes = [
//        FlazhCardNotesModel(flazhcardName: "The Use of Accessibility", flazhcardDescription: "lorem ipsum")
//
//    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Image("HomeBackground")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text("Your Notes")
                        .font(.custom("Poppins-Bold", size: 35))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Button {
                        showView.toggle()
                    } label: {
                        Text("+")
                            .font(.custom("Poppins-Medium", size: 40))
                            .foregroundColor(Color.red)
                    }
                    .sheet(isPresented: $showView) {
                                    addFlazhCardView()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 89)
                
                ScrollView {
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 75)
            }
            
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .frame(maxHeight: 100)
                
                Button {
                    print("Testing")
                } label: {
                    Image("Start_Button")
                }
                .offset(x: 0, y: -30)
            }
        }
    }
    
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            notesCategoryDetailsView()
        }
    }
}

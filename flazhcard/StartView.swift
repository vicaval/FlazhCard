//
//  StartView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI


struct StartView: View {
    
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
                        print("test")
                    } label: {
                        Text("+")
                            .font(.custom("Poppins-Medium", size: 40))
                            .foregroundColor(Color.red)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 89)
                
                ScrollView {
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .frame(height: 80.0)
                        
                        VStack(alignment: .leading)  {
                            Text("Design")
                                .font(.custom("Poppins-Bold", size: 18))
                                .multilineTextAlignment(.leading)
                            
                            
                            Text("5 FlazhCards")
                                .font(.custom("Poppins-Regular", size: 16))
                        }
                        .padding(.leading, 20.0)
                        
                    }
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
            StartView()
        }
    }
}
//
//  StartView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI


struct NotesCategoryDetailsView: View {
    
    @State var showView = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Card.entity(), sortDescriptors: [])
    private var products: FetchedResults<Card>
    
    var flazhCardTitle: String
    var flazcCardDesc: String
    
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
                        AddFlazhCardView()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 95)
                
                ScrollView {
                    
                    FlazhCardNotesContainerView(flazhcardName: flazhCardTitle, flazhcardDescription: "Lorem ipsum dolor sit amet")
                }
                .padding(.horizontal)
                .padding(.top, 75)
            }
            
            StartButton()
        }
        .ignoresSafeArea()
    }
}

struct StartButton: View {
    var body: some View {
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

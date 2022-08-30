//
//  FlazhCardView.swift
//  flazhcard
//
//  Created by vica valencia on 24/07/22.
//

import SwiftUI

struct FlazhCardView: View {
    
    @State var isFlipped = false
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    var category: Category
    var cards: [Card]
    
    init(category: Category, categoryTitle: String) {
        self.category = category
        self.cards = (category.cards)?.allObjects as! [Card]
    }
    
    var body: some View {
        ZStack {
            
            Image("FlazhCard_bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    Rectangle()
                        .frame(width: 339, height: 428)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.top, 125)
                        .onTapGesture {
                            isFlipped.toggle()
                        }
                    
                    Circle()
                        .foregroundColor(Color(red: 45/225, green: 54/225, blue: 159/225))
                        .frame(width: 33, height: 33)
                        .position(isFlipped ? CGPoint(x: 65, y: 180) : CGPoint(x: 325, y: 180))
                    
                    
                    VStack {
                        
                        Text(isFlipped ? cards[0].cardDesc ?? "" : cards[0].cardTitle ?? "")
                            .font(isFlipped ? .custom("Poppins-Regular", size: 20) : .custom("Poppins-SemiBold", size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.all, 50.0)
                        
                    }
                    .padding(.top, 120)
                }
                .overlay(
                    VStack {
                        HStack {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Exit")
                            }
                            
                            Spacer()
                        }
                        .font(.custom("Poppins-Regular", size: 15))
                        .padding(.horizontal, 20)
                        .padding(.top, 5)
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                )
                
                Spacer()
                
                HStack {
                    Button {
                        print("Testing")
                    } label: {
                        Image("left_disabled")
                    }
                    .padding(.trailing, 15)
                    
                    
                    Text("2 of \(cards.count)")
                        .frame(width: 115)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Button {
                        print("Testing")
                    } label: {
                        Image("right_enabled")
                    }
                    .padding(.leading, 15)
                    
                }
                .padding(.bottom, 120)
            }
        }
    }
}

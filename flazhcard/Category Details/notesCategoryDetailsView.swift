//
//  StartView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI


struct NotesCategoryDetailsView: View {
    
    @State var showAdd = false
    @State var showEdit = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var category: Category
    var cards: [Card]
    var categoryTitle: String
    
    init(category: Category, categoryTitle: String) {
        self.category = category
        self.cards = (category.cards)?.allObjects as! [Card]
        self.categoryTitle = categoryTitle
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Image("HomeBackground")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text(categoryTitle)
                        .font(.custom("Poppins-Bold", size: 35))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Button {
                        showAdd.toggle()
                    } label: {
                        Text("+")
                            .font(.custom("Poppins-Medium", size: 40))
                            .foregroundColor(Color.red)
                    }
                    .sheet(isPresented: $showAdd) {
                        AddFlazhCardView(category: category)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 95)
                
                ScrollView {
                    if cards.count > 0 {
                        ForEach(cards, id: \.id) { card in
                            Button {
                                showEdit.toggle()
                            } label: {
                                FlazhCardNotesContainerView(flazhcardName: card.cardTitle ?? "", flazhcardDescription: card.cardDesc ?? "")
                                    .foregroundColor(.black)
                            }
                            .sheet(isPresented: $showEdit) {
                                EditFlazhCardView(
                                    category: category,
                                    cardName: card.cardTitle ?? "",
                                    cardDesc: card.cardDesc ?? "")
                            }
                        }
                    } else {
                        Text("Let's start by adding\nnote's card")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .multilineTextAlignment(.center)
                            .padding(.top, 200)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 75)
            }
            
            StartButton(category: category)
        }
        .ignoresSafeArea()
    }
}

struct StartButton: View {
    
    var category: Category
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(maxHeight: 100)
            
            NavigationLink {
                FlazhCardView(category: category, categoryTitle: "").navigationBarHidden(true)
            } label: {
                Image("Start_Button")
            }
            .offset(x: 0, y: -30)
        }
    }
}

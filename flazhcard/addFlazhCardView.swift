//
//  SecondView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct addFlazhCardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = CategoryViewModel()
    
    @State var showView = false
    @State private var title: String = ""
    @State private var description: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        ZStack {
            
            Color(red: 245/255, green: 245/255, blue: 245/255)
                .ignoresSafeArea()
            
            VStack {
                Text("Title")
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    TextField("Add Title", text: $title)
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding(15)
                }
                .background(.white)
                .cornerRadius(10)
                
                
                Text("Description")
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .topLeading) {
                    
                    TextEditor(text: $description)
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding(15)
                        .background(.white)
                    
                    if description.isEmpty {
                        Text("Add Description")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding(17)
                            .padding(.top, 5)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    }
                }
                .background(.white)
                .cornerRadius(10)
                .frame(maxHeight: 320)
                
                Spacer()
                
                Button {
//                    viewModel.cards.append(Card(id: UUID(), title: title, description: description))
                    print(viewModel.cards)
                    print(viewModel.cards[0].title)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.red)
                        Text("Save")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 50)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 2))
                            .foregroundColor(.red)
                        Text("Cancel")
                            .bold()
                            .foregroundColor(.red)
                    }
                }
                .frame(height: 50)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 30)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        notesCategoryView()
    }
}

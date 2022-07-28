//
//  SecondView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct AddFlazhCardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) private var viewContext
        
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    private var products: FetchedResults<Category>
    
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
    
    private func addFlazhCard() {
        
        withAnimation {
            
            let card = Card(context: viewContext)
            card.cardId = UUID()
            card.cardTitle = title
            card.cardDesc = description
            
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            print("Apa ye")
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        AddFlazhCardView()
    }
}

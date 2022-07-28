//
//  addalertView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct AddNotesCategoryAlertView: View {
    
    let screenSize = UIScreen.main.bounds
    
    @Environment(\.managedObjectContext) private var viewContext
        
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    private var products: FetchedResults<Category>
    
    @Binding var isShown: Bool
    @Binding var text: String
    var title: String = "New Note Category"
    
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 20))
            
            TextField("", text: $text)
                .font(.custom("Poppins-Regular", size: 18))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            Button {
                self.isShown = false
                addCategory()
                self.text = ""
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.red)
                    Text("Create")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .frame(height: 40)
            .padding(.top, 20)
        
            
        }
        .padding()
        .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.23)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
//        .shadow(color: .gray, radius: 6, x: 0, y: 2)

        
    }
    
    private func addCategory() {
        
        withAnimation {
            let category = Category(context: viewContext)
            category.categoryId = UUID()
            category.categoryName = text
            
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



//
//  addalertView.swift
//  flazhcard
//
//  Created by vica valencia on 26/07/22.
//

import SwiftUI

struct addNotesCategoryAlertView: View {
    @EnvironmentObject var viewModel: CategoryViewModel
    
    let screenSize = UIScreen.main.bounds
    
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
            
            Button {
                self.isShown = false
//                viewModel.categories.append(Category(id: UUID(), categoryName: text))
                viewModel.categoryNames.append(text)
                print(viewModel.categoryNames)
//                print(viewModel.categories[0].categoryName)
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
}

struct addalertView_Previews: PreviewProvider {
    static var previews: some View {
        addNotesCategoryAlertView(isShown: .constant(true), text: .constant("")).environmentObject(CategoryViewModel())
    }
}

//
//  ContentView.swift
//  flazhcard
//
//  Created by vica valencia on 21/07/22.
//

import SwiftUI
import CoreData

struct NotesCategoryView: View {
    
//    init() {
//        UITableView.appearance().separatorStyle = .none
//        UITableView.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().backgroundColor = .clear
//    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [NSSortDescriptor(key: "categoryName", ascending: true)])
    private var categories: FetchedResults<Category>
    
    @State private var hasContent = false
    
    //alert
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
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
                            self.isPresented = true
                            hasContent.toggle()
                        } label: {
                            Text("+")
                                .font(.custom("Poppins-Medium", size: 40))
                                .foregroundColor(Color.red)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 89)
                    
                    ScrollView {
                        if categories.count > 0 {
                            ForEach(categories, id: \.id) { category in
                                NavigationLink {
                                    NotesCategoryDetailsView(category: category)
                                } label: {
                                    CardCategoryContainerView(categoryName: category.categoryName ?? "", flazhcardCount: category.cards?.count ?? 0)
                                }
                                .foregroundColor(.black)
                                .buttonStyle(.borderless)
                            }
                            .onDelete(perform: deleteProducts(offsets:))
                        } else {
                            Text("Let's start by adding\nnote's category")
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .multilineTextAlignment(.center)
                                .padding(.top, 200)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 75)
                    .background(Color.clear)
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .overlay(
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                        .opacity(isPresented ? 0.3 : 0)
                        .foregroundColor(.black)
                    AddNotesCategoryAlertView(isShown: $isPresented, text: $text)
                }
                    .animation(.easeIn)
            )
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { categories[$0] }.forEach(viewContext.delete)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesCategoryView()
    }
}

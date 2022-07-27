//
//  ContentView.swift
//  flazhcard
//
//  Created by vica valencia on 21/07/22.
//

import SwiftUI
import CoreData

struct notesCategoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var hasContent = false
    
    //alert
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    
    // Dummy Category Data
    var categories = [
        NotesCategoryModel(categoryName: "Design", totalFlazhCard: 1),
        NotesCategoryModel(categoryName: "Tech", totalFlazhCard: 2),
        NotesCategoryModel(categoryName: "Product", totalFlazhCard: 3),
        NotesCategoryModel(categoryName: "Romance", totalFlazhCard: 4),
        NotesCategoryModel(categoryName: "Color", totalFlazhCard: 5),
        NotesCategoryModel(categoryName: "Code", totalFlazhCard: 6)
    ]

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
                        
                        if hasContent {
                            
                            ForEach(categories, id: \.id) { category in
                                
                                NavigationLink {
                                    Text("Hello, world!")
                                } label: {
                                    CardCategoryContainerView(categoryName: category.categoryName, flazhcardCount: category.totalFlazhCard)
                                }
                                .foregroundColor(.black)
                            }
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
                }
            }
            .navigationBarHidden(true)
            .overlay(
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                        .opacity(isPresented ? 0.3 : 0)
                        .foregroundColor(.black)
                    addNotesCategoryAlertView(isShown: $isPresented, text: $text)
                }
                    .animation(.easeIn)
        )
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        notesCategoryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

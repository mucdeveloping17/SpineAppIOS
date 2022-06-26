//
//  MultipleSelectionList.swift
//  spine
//
//  Created by Mac on 21/06/22.
//

import SwiftUI

struct MultipleSelectionList: View {
    let type: ItemType
    @Binding var selections: [String]
    @State var listItems: [String] = []
    @State var tempSelections: [String] = []
    let screenWidth = UIScreen.main.bounds.size.width
    @Environment(\.dismiss) var dismiss
    @State var searchTxt = ""
    
    var body: some View {
        VStack {
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.vertical, 5)
            VStack(alignment: .leading, spacing: 0) {
                Text(type == .category ? "Select event categories" : "Select languages")
                    .font(.custom("Avenir", size: 18))
                    .padding(.leading, 30)
                CustomSearchBar(placeHolder: "Search ", searchText: $searchTxt, screenWidth: UIScreen.main.bounds.size.width - 60)
            }
            
            List {
                ForEach(self.listItems, id: \.self) { item in
                    MultipleSelectionRow(title: item, isSelected: self.tempSelections.contains(item)) {
                        if self.tempSelections.contains(item) {
                            self.tempSelections.removeAll(where: { $0 == item })
                        }
                        else {
                            self.tempSelections.append(item)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }.listStyle(.plain)
            Spacer()
            
            LargeButton(title: "APPLY FILTER", width: screenWidth - 100, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                selections = tempSelections
                self.dismiss()
            }.padding(.bottom, 20)
        }.onAppear(perform: {
            if type == .language {
                listItems = ["Apples", "Oranges", "Bananas", "Pears", "Mangos", "Grapefruit"]
            } else {
                listItems = ["Category1", "Category2", "Category3", "Category4", "Category5"]
            }
            tempSelections = selections
        })
            .navigationBarTitle(getTitle(itemType: type), displayMode: .inline)
            //.searchable(text: $searchTxt)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
    }
    
    func getTitle(itemType: ItemType)-> String {
        if itemType == .category {
            return "SELECT CATEGORIES"
        } else if itemType == .language {
            return "SELECT LANGUAGES"
        }
        return ""
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack(spacing: 10) {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    //.foregroundColor(.lightGray2)
                Text(self.title)
                    .font(.custom("Avenir", size: 16))
                    Spacer()
                
            }
        }.foregroundColor(.primary)
            .padding(5)
    }
}

//
//  FilterPodcastView.swift
//  spine
//
//  Created by Mac on 22/05/22.
//

import SwiftUI

enum ItemType {
    case language
    case category
}

struct FilterPodcastView: View {
    @Environment(\.dismiss) var dismiss
    let screenWidth = UIScreen.main.bounds.size.width
    @State var showPopOver = false
    @State var languages: [String] = []
    @State var categories: [String] = []
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Text("FILTER")
                            .font(.custom("Avenir", size: 18))
                        Spacer()
                        ButtonWithSystemImage(image: "multiply", size: 18) {
                            dismiss()
                        }
                    }.padding()
                    LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4)
                }
                
                VStack(alignment: .leading, spacing: 40) {
                    Text("What can we help you find?")
                        .font(.custom("Avenir", size: 18))
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Language").font(.custom("Avenir", size: 14))
                        NavigationLink(destination: MultipleSelectionList(type: .language, selections: $languages)) {
                            CustomSearchBar1(items: $languages.count)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Category").font(.custom("Avenir", size: 14))
                        NavigationLink(destination: MultipleSelectionList(type: .category, selections: $categories)) {
                            CustomSearchBar1(items: $categories.count)
                        }
                    }
                    
                    LargeButton(title: "FIND PODCASTS", width: screenWidth - Kconstant.filterPadding, height: 40, bColor: Color.lightBrown, fSize: 15, fColor: .white) {
                        dismiss()
                    }
                    
                }.padding(.horizontal, Kconstant.filterPadding/2)
                
                Spacer()
            }.padding(.vertical, 10)
                .navigationBarHidden(true)
        }
        
        
    }
}

struct FilterPodcastView_Previews: PreviewProvider {
    static var previews: some View {
        FilterPodcastView()
    }
}


struct CustomSearchBar1: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let items: Int
    //let totalPadding: CGFloat = 60
    
    var body: some View {
        Text("\(items) Items").frame(width: screenWidth - Kconstant.filterPadding, height: 30, alignment: .leading)
            .padding(.leading, 10)
                .padding(5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                .foregroundColor(.primary)
    }
}

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
            .navigationTitle(type == .language ? "Language" : "Category")
            .searchable(text: $searchTxt)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    Spacer()
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
            }
        }.foregroundColor(.primary)
            .padding(5)
    }
}

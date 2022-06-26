//
//  SubCategoryView.swift
//  spine
//
//  Created by Mac on 14/06/22.
//

import SwiftUI

enum AlertErrorMsg: String, Identifiable {
    var id: String {
        rawValue
    }
    case invalidLength = "Please enter ateast 3 characters "
    case duplicate = "Subcategory already exist"
}

struct SubCategoryView: View {
    let mainCategory: String
    @Binding var categories: [String]
    @Binding var selectedCategories: [String]
    @State var showAdditionalCatg = false
    @State var newCategory = ""
    @State var alertMsg: AlertErrorMsg?
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("Choose up to 3 sub-categories of\n\(mainCategory)")
                    .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                ButtonGrid(categories: $categories, tempSelections: $selectedCategories)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        showAdditionalCatg.toggle()
                    } label: {
                        Image(systemName: showAdditionalCatg ? "minus.circle" : "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("Add an additional category")
                        .font(.custom("Avenir", size: 14))
                    Spacer()
                }.foregroundColor(.lightBrown)
                
                if showAdditionalCatg {
                    HStack {
                        CustomTextField2(searchText: $newCategory, placeholder: "Enter a new category")
                        LargeButton(title: "ADD", width: 70, height: 30, bColor: Color.lightBrown, fSize: 12, fColor: .white) {
                            if newCategory.count > 2 {
                                if !categories.contains(newCategory) {
                                    categories.insert(newCategory, at: 0)
                                    newCategory = ""
                                } else {
                                    alertMsg = .duplicate
                                }
                            } else {
                                alertMsg = .invalidLength
                            }
                        }
                    }
                }
            }
        }
        .alert(item: $alertMsg) { item in
            Alert(title: Text(item.rawValue), message: Text(""), dismissButton: .cancel())
        }
    }
}

struct ButtonGrid: View {
    @Binding var categories: [String]
    @Binding var tempSelections: [String]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: Array(repeating: .init(.fixed(120)), count: 3)) {
                ForEach(categories, id: \.self) { item in
                    let isOn = self.tempSelections.contains(item)
                    
                    Button {
                        if self.tempSelections.contains(item) {
                            self.tempSelections.removeAll(where: { $0 == item })
                        }
                        else {
                            if self.tempSelections.count < 3 {
                                self.tempSelections.append(item)
                            }
                        }
                    } label: {
                        Text(item)
                            .font(.custom("Avenir", size: 12)).fontWeight(.thin)
                            .frame(width: 110, height: 25)
                            .foregroundColor(isOn ? .white : .lightBrown)
                            .background(isOn ? Color.lightBrown : .white)
                            .cornerRadius(20)
                            .border(Color.lightBrown, width: 0.7, cornerRadius: 20)
                            .padding(3)
                    }
                }
            }
        }.frame(maxHeight: 200)
       
    }
}


//struct SubCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubCategoryView()
//    }
//}

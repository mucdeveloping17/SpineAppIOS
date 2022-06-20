//
//  PodcastInfoView.swift
//  spine
//
//  Created by Mac on 31/05/22.
//

import SwiftUI

struct PodcastInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State var newCategory = ""
    @State var selectedLanguage = C.PlaceHolder.language
    @State var selectedCategory = C.PlaceHolder.category
    @State var commentsOn = false
    @State var showAdditionalCatg = false
    @State var categories = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6","Item 7"]
    @State var selectedCategories: [String] = []
    @State var showReviewScreen = false
    
    @State var profileText = "Lorem ada dasd adad asdsadada da d a dadadadasd ada dadada dad adasdasd adad ad ada da dsa daddads dada dadsfaadfdfdfd fdfd ddadsada dadadada dasdasd asdasd asdadada dadadadsada dfgfgg gfhfh gfhgjng ngjng nngn gng ng hn gnhgnghng ng ngnh nhn g ng  ngngnhgngngng n gng n gngnghng"
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ScrollView {
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
            VStack(spacing: 30) {
                
                HStack(alignment: .top) {
                    Text("Podcast image")
                        .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                        .padding(.top, 10)
                    Spacer()
                    Image("podcastDetailBanner")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)
                        
                }
                VStack(alignment: .leading) {
                    Text("Podcast title")
                        .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                    CustomTextView(text: "Lorem ipsum dolor sit amet")
                }
                
                VStack(alignment: .leading) {
                    Text("About the podcast")
                        .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                        CustomTextEditor(text: $profileText)
                }
                
                VStack(alignment: .leading) {
                    Text("Primary language spoken in your the podcast")
                        .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                    
                    NavigationLink(destination: ItemSelectionView(selectedItem: $selectedLanguage, itemType: .language)) {
                        CustomNavigationView(selectedItem: $selectedLanguage)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Podcast category")
                        .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                    
                    NavigationLink(destination: ItemSelectionView(selectedItem: $selectedCategory, itemType: .category)) {
                        CustomNavigationView(selectedItem: $selectedCategory)
                    }
                }
                
                if selectedCategory != C.PlaceHolder.category && selectedLanguage != C.PlaceHolder.language {
                    VStack(alignment: .leading) {
                        Text("Choose up to 3 sub-categories of\n\(selectedCategory)")
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
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    HStack {
                        Text("Allow comments")
                            .font(.custom("Avenir", size: 14)).fontWeight(.heavy)
                        Spacer()
                        Toggle("", isOn: $commentsOn)
                            .tint(.lightBrown)
                    }
                    
                    Text("Would you like to promote your post, click here")
                        .font(.custom("Avenir", size: 14))
                        .underline()
                    
                    LargeButton(title: "REVIEW", width: 120, height: 40, bColor: Color.lightBrown, fSize: 12, fColor: .white) {
                        showReviewScreen = true
                    }
                    
                    NavigationLink("", isActive: $showReviewScreen) {
                        ReviewPodcastView()
                    }
                }
                
                
                
            }.padding(20)
            Spacer()
        }
            .navigationBarTitle(Text("PODCAST INFO"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
            .navigationBarItems(trailing: LargeButton(title: "REVIEW", width: 60, height: 22, bColor: Color.lightBrown, fSize: 12, fColor: .white) {
                print("Tapped")
            }//.opacity(0.3).disabled(true)
            )
        
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

struct CustomNavigationView: View {
    @Binding var selectedItem: String
    var body: some View {
        ZStack {
            Text("")
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                .foregroundColor(.primary)
            HStack {
                Text(selectedItem)
                    .font(.custom("Avenir", size: 14)).fontWeight(.regular)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(.horizontal, 10)
                .foregroundColor(Color(hex: 0x2C2C2C))
        }
    }
}

struct CustomTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Avenir", size: 14)).fontWeight(.regular)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(7)
            .background(Color(hex: 0xF4F4F4)) //D8D8D8 F4F4F4
    }
}

struct CustomTextEditor: View {
    @Binding var text: String
    var body: some View {
        TextEditor(text: .constant(self.text)) //text: .constant(self.text)
            .font(.custom("Avenir", size: 14))
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .padding(4)
            .background(Color(hex: 0xF4F4F4))
    }
}

extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}

struct CustomTextField2: View {
    @Binding var searchText: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text("")
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                .padding(5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.7), radius: 5)
                
            TextField(placeholder, text: $searchText)
                .font(Font.system(size: 14))
                .padding(.leading, 8)
        }
    }
}

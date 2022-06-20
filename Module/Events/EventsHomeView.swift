//
//  EventsHomeView.swift
//  spine
//
//  Created by Mac on 11/06/22.
//

import SwiftUI

struct EventsHomeView: View {
    @State var searchText = ""
    @State var showFilter = false
    @State var showAdd = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    HStack(spacing: 0) {
                        CustomButton(image: "AddMenu") {
                            self.showAdd.toggle()
                        }
                        CustomSearchBar(placeHolder: "Search events", searchText: $searchText)
                        CustomButton(image: "FilterBTN") {
                            print("Filter tapped")
                            showFilter = true
                        }
                    }.padding(.horizontal)
                    Spacer()
                    NavigationLink("next screen", destination: Text("detail"))
                }
                
                VStack {
                    Spacer()
                    CustomAddItemSheet().offset(y: self.showAdd ? 0: UIScreen.main.bounds.height)
                }.background((self.showAdd ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                    self.showAdd.toggle()
                }).edgesIgnoringSafeArea(.all)
            }
            .animation(.default, value: showAdd)
            .navigationBarHidden(true)
            
            .fullScreenCover(isPresented: $showFilter) {
                FilterPodcastView()
            }
        }
    }
}

struct EventsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EventsHomeView()
    }
}

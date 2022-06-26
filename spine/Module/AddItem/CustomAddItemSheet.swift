//
//  CustomAddItemSheet.swift
//  spine
//
//  Created by Mac on 25/05/22.
//

import SwiftUI

struct CustomAddItemSheet: View {
    
    var body: some View {
        VStack {
            Text("").frame(width: 80, height: 4, alignment: .center).background(.gray)
            Text("Add").bold().padding()
            List {
                NavigationLink(destination: Text("Detail1")) {
                    Text("Question or Thought")
                }.padding(.vertical, 10)
                NavigationLink(destination: Text("Detail2")) {
                    Text("Picture or Video")
                }.padding(.vertical, 10)
                NavigationLink(destination: Text("Detail3")) {
                    Text("Story")
                }.padding(.vertical, 10)
                NavigationLink(destination: Text("Detail3")) {
                    Text("Event")
                }.padding(.vertical, 10)
                NavigationLink(destination: LinkRSSView()) {
                    Text("Podcast")
                }.padding(.vertical, 10)
                NavigationLink(destination: Text("Detail3")) {
                    Text("Ad")
                }.padding(.vertical, 10)
            }
            //.scrollEnabled(false)
            .listStyle(.plain)
            .frame(height: 320)
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 70)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct customRow: View {
    let title: String
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }.padding(.horizontal, 20)
    }
}

extension View {
  @ViewBuilder func scrollEnabled(_ enabled: Bool) -> some View {
    if enabled {
      self
    } else {
      simultaneousGesture(DragGesture(minimumDistance: 0),
                          including: .all)
    }
  }
}


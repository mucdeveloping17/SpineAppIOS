//
//  ItemSelectionView.swift
//  spine
//
//  Created by Mac on 31/05/22.
//

import SwiftUI

struct ItemSelectionView: View {
    @Binding var selectedItem: String
    let itemType: ItemType
    let items = ["Item1", "Item2", "Item3","Item4", "Item5"]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 30) {
            LinearGradient(colors: [.white, Color(.sRGB, white: 0.85, opacity: 0.3)], startPoint: .bottom, endPoint: .top).frame(height: 4).padding(.top, 10)
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedItem = item
                            dismiss()
                        }
                }
            }.listStyle(.plain)
        }
        .navigationTitle(itemType == .language ? "Select Language" : "Select Category")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.dismiss()
        }){
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}


//
//  DateSelectionView.swift
//  spine
//
//  Created by Mac on 15/06/22.
//

import SwiftUI

struct DateSelectionView: View {
    let type: CalnderType
    @Binding var selectedDate: Date
    var size: CGFloat = 20
    var dateString: String {
        if type == .date {
            return selectedDate.toString(format: "dd.MM.yyyy")
        } else {
            return selectedDate.toString(format: "HH:mm")
        }
    }
    
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
                Image(systemName: type == .date ? "calendar" : "clock")
                    .resizable()
                    .frame(width: size, height: size)
                Text(dateString)
                    .font(.custom("Avenir", size: 14)).fontWeight(.regular)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(.horizontal, 10)
            DatePicker("", selection: $selectedDate, displayedComponents: type == .date ? .date: .hourAndMinute)
                .background(Color.white).opacity(0.02)
        }
    }
}


//struct DateSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DateSelectionView()
//    }
//}

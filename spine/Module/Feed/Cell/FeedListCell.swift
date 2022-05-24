//
//  FeedListCell.swift
//  spine
//


import SwiftUI

struct FeedListCell: View {
    @State var name : String
    @State var isSubmitted   : Bool
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Image("ic_launch")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(60)
                        .padding(.leading, 20)
                    CustomDotView(height: 10).padding(.bottom, 45)
                        .padding(.leading, 60)
                }//.frame(alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Promoted by")
                        .font(.system(.headline, design: .default))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                    Text("Oliver Reese")
                        .font(.custom(FontStyle.Montserrat_Regular.rawValue, size: 15))
                        .foregroundColor(Color.gray)
                }.padding(.leading, 10)
            }
            .padding(.top, 5)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            HStack {
                Image("ic_launch")//.scaledToFit()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height:250)
            }.clipped()
            HStack {
                Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form.")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
            }.padding([.leading, .top, .trailing], 20)
                .padding(.bottom, 10)
            Divider().padding([.leading, .trailing], 20)
        }.background(Color.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct FeedListCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedListCell(name: "", isSubmitted: false)
    }
}

//
//  HomeHeaderView.swift
//  spine
//
//

import SwiftUI
var data = ["Question or thought","Picture or video","Story","Event","Podcast","Ad"]


enum HomeHeaderTabType {
    case discover
    case following
}
struct HomeHeaderView: View {
    let tabTypeCompletion: (_ tabType:HomeHeaderTabType) -> ()
    @State private var selectTab:HomeHeaderTabType = .discover
    @State var halfModel_shown = false
    @State private var didSelectTab:Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        halfModel_shown.toggle()
                    } label: {
                        Text("+")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black)
                            .padding(.all, 5)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    HStack {
                        VStack {
                            Button {
                                print("DISCOVER Button Pressed")
                                selectTab = .discover
                                tabTypeCompletion(selectTab)
                                self.didSelectTab = true
                            } label: {
                                Text("DISCOVER")
                                    .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                                    .foregroundColor(Color.black)
                                    .padding(.top, 20)
                            }
                            Rectangle().frame(height: 4.0, alignment: .top)
                                .foregroundColor(K.appColors.appTheme).opacity(selectTab == .discover ? 1.0 : 0.0)
                        }
                        .frame(width:90)
                    }
                    HStack {
                        VStack {
                            Button {
                                print("FOLLOWING Button Pressed")
                                selectTab = .following
                                tabTypeCompletion(selectTab)
                                self.didSelectTab = false
                            } label: {
                                Text("FOLLOWING")
                                    .font(.custom(FontStyle.Montserrat_Medium.rawValue, size: 14))
                                    .foregroundColor(Color.black)
                                    .padding(.top, 20)
                            }
                           
                            Rectangle().frame(height: 4.0, alignment: .top)
                                .foregroundColor(K.appColors.appTheme)
                                .opacity(selectTab == .following ? 1.0 : 0.0)
                        }
                        .frame(width:100)
                    }.padding(.leading, 10)
                    Spacer()
                    Button {
                        print("Search Button Pressed")
                    } label: {
                        Text("Q")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black)
                            .padding(.all, 5)
                            .padding(.trailing, 10)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .frame(height:50)
            
        }
        if(didSelectTab == true){
            FeedListVC()
        }else{
            FeedFollowingVC()
        }
        if halfModel_shown {
            addFeedPopup(halfModel_shown: $halfModel_shown)
        }
    }
}
extension HomeHeaderView {
    func addButtonClick() {
        print("Pluse Button Pressed")
        halfModel_shown.toggle()
       // addFeedPopup(halfModel_shown: $halfModel_shown)
    }
}
struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView { tabType in
            print(tabType)
        }
    }
}


struct CustomDivider: View {
    let height: CGFloat = 5
    let color: Color
    let opacity: Double = 1
    
    var body: some View {
        Group {
            Rectangle()
        }
        .frame(height: height)
        .foregroundColor(color)
        .opacity(opacity)
    }
}


struct CustomDotView: View {
    var height: CGFloat = 20
    var color: Color = Color.orange
    
    var body: some View {
        Group {
            Rectangle()
        }
        .frame(width:height, height: height)
        .foregroundColor(color)
        .cornerRadius(height)
    }
}

//struct CustomDotView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomDotView()
//    }
//}

struct FeedFollowingVC: View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                FollowingFeedListVC()
            }
        }
    }
}

struct addFeedPopup:View{
    @Binding var halfModel_shown:Bool
    
    var body: some View{
        
        
        CustomHalfSheetsUIView(isShown: $halfModel_shown){
            
            VStack{
                Rectangle()
                    .frame(width: 200, height: 10, alignment: .center)
                    .foregroundColor(Color.init(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.2))
                    .cornerRadius(10)
                    .shadow(radius: 0.4)
                
                
                Text("ADD")
                    .font(.custom(FontStyle.Montserrat_Bold.rawValue, size: 20))
                
                
                List(0..<1) { item in
                    ForEach(data.indices, id:\.self){x in
                        VStack{
                            CardView(filter: data[x])
                                .font(.custom(FontStyle.Montserrat_Bold.rawValue, size: 16))
                        }
                        
                    }
                    
                }
                .listStyle(.plain)
                .padding(.top,20)
                
            }
            
        }
    }
}

struct CardView:View{
    @State var filter:String = "hello"
    
    var body: some View{
        HStack{
            Text(filter)
                .fontWeight(.regular)
                .foregroundColor(Color.black.opacity(0.7))
                .padding()
            Spacer()
            ZStack{
                Image("ic_rightarrow")
                    .padding()
            }
        }
        .padding(.horizontal)
    }
}

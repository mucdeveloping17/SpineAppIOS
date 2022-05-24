//
//  StoriesVC.swift
//  spine
//
//  Created by OM Apple on 13/05/22.
//

import SwiftUI

struct StoriesVC: View {
    var body: some View {
        VStack {
            HStack {
               
               Spacer()
                Text("STORIES")
                    .font(.title2)
                    .padding(.leading,50)
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            
            }
            .frame(width: UIScreen.main.bounds.width-40)
            .padding()
            .padding(.top,-100)
           
            
            Text("Discover moments of People's life and get inspired by them.")
                .frame(width: UIScreen.main.bounds.width-90)
                .foregroundColor(Color.gray)
                .font(.title3)
                //.padding(.top,20)
            
            ScrollView {
                ForEach(0..<5){x in
                    page1Stories()
                        .padding()
                }
            }
            .padding()
          
        }
      
    }
}

struct StoriesVC_Previews: PreviewProvider {
    static var previews: some View {
        StoriesVC()
        //page1Stories()
    }
}


struct page1Stories:View{
    var body: some View{
        
        HStack{
            VStack (alignment:.center){
                
             
                
                Image("BG")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                   
                    .border(.red)
                    .cornerRadius(50)
                    
               
                
               
                Text("Sophie")
                    .bold()
                Text("Living with mental illness")
                    .frame(width: 110, height: 70, alignment: .center)
                Text("+ Fallow")
                    .foregroundColor(Color.gray)
                
            }
            VStack (alignment:.center){
                Image("BG")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    
                
                Text("Oliver")
                    .bold()
                
                Text("My cup is always half full")
                    .frame(width: 110, height: 70, alignment: .center)
                
                Text("+ Fallow")
                    .foregroundColor(Color.gray)
                
                
            }
            VStack (alignment:.center){
                Image("BG")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                
                Text("Kira")
                    .bold()
                
                Text("Living with nature")
                    .frame(width: 110, height: 70, alignment: .center)
                Text("+ Fallow")
                    .foregroundColor(Color.gray)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width-40)
    }
}

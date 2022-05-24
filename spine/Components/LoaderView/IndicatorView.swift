//
//  IndicatorView.swift

import SwiftUI

struct IndicatorView: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack {
            if isAnimating {
                ZStack {
                    Color.black.opacity(0.30)
                        .edgesIgnoringSafeArea(.all)
                    
                    ActivityIndicator()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView(isAnimating: .constant(true))
    }
}

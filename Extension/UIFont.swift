//
//  UIFont.swift

//  Copyright © 2020 iOS Developer. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

extension Font {
    
    public enum PoppinsType: String {
        case Bold = "-Bold"
        case regular = "-Regular"
        case SemiBold = "-SemiBold"
        
    }
    
    static func Poppins(type: PoppinsType, size: CGFloat) -> Font {
        return Font.custom("Poppins\(type.rawValue)", size: size)
    }
    
    public enum AvenirType: String {
        case black = "-Black"
        case regular = "-Regular"
        case book = "-Book"
        case medium = "-Medium"
    }
    
    static func Avenir(type: AvenirType, size: CGFloat) -> Font {
        return Font.custom("Avenir\(type.rawValue)", size: size)
    }    
}

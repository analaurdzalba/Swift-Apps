//
//  fonts.swift
//  App01-MisDatos
//
//  Created by Ana Laura Rodriguez on 19/02/21.
//

import Foundation
import SwiftUI

extension Font {
    public static func Merriweather(size: CGFloat) -> Font {
        return Font.custom("Merriweather-Bold", size: size)
    }
    public static func Oswald(size: CGFloat) -> Font {
        return Font.custom("Oswald-Regular", size: size)
    }
}

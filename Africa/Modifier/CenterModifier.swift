//
//  CenterModifier.swift
//  Africa
//
//  Created by Samroz Javed on 05/08/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

//
//  InsetFactView.swift
//  Africa
//
//  Created by Samroz Javed on 01/08/2022.
//

import SwiftUI

struct InsetFactView: View {
    let animal: animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//:GROUPBOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

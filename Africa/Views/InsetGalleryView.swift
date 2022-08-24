//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Samroz Javed on 31/07/2022.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            } //: HSTACK
        }//: SCROLLVIEW
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

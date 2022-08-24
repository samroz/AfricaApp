//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Samroz Javed on 04/08/2022.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

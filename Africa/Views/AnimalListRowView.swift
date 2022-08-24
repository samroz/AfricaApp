//
//  AnimalListRowView.swift
//  Africa
//
//  Created by Samroz Javed on 30/07/2022.
//

import SwiftUI

struct AnimalListRowView: View {
    let animal: animal
    var body: some View {
        HStack (alignment: .center, spacing: 16){
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }//: VSTACK
        }
    }
}

struct AnimalListRowView_Previews: PreviewProvider {
    
    static let animals: [animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListRowView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

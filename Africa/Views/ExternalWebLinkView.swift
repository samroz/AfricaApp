//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Samroz Javed on 01/08/2022.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://"))!)
                }
            }//: HSTACK
        }//: BOX
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

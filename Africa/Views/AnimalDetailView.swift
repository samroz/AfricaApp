//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Samroz Javed on 31/07/2022.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                
                Group {
                    DetailHeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                
                Group {
                    DetailHeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    DetailHeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                
                // MAP
                
                Group {
                    DetailHeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                
                // LINK
                
                Group{
                    DetailHeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
            }
        }//: SCROLL
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}

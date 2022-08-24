//
//  CoverImageView.swift
//  Africa
//
//  Created by Samroz Javed on 30/07/2022.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [coverImage] = Bundle.main.decode("covers.json")
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                .resizable()
            .scaledToFill()
            } //: LOOP
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

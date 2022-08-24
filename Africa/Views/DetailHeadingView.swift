//
//  DetailHeadingView.swift
//  Africa
//
//  Created by Samroz Javed on 31/07/2022.
//

import SwiftUI

struct DetailHeadingView: View {
    var headingImage: String
    var headingText: String
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
        }//: HSTACK
        .padding(.vertical)
        
    }
}

struct DetailHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

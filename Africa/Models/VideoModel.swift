//
//  VideoModel.swift
//  Africa
//
//  Created by Samroz Javed on 01/08/2022.
//

import Foundation

struct video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    //This property is not in json file video.json.
    //We will use it many a times.
    var thumbnail: String {
        "video-\(id)"
    }
}

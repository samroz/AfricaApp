//
//  AnimalModel.swift
//  Africa
//
//  Created by Samroz Javed on 31/07/2022.
//

import SwiftUI

struct animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}

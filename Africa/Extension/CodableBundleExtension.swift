//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Samroz Javed on 30/07/2022.
//

import Foundation

extension Bundle {
    //We can use <T: Codable> to get generic data type not just coverImage
    //func decode(_ file: String) -> [coverImage] {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        //Here we can also use T type instead of [coverImage]
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        // 5. Return the Ready-to-use data
        print("final data ", loaded)
        return loaded
    }
}

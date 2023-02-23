//
//  ImagePathMapper.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation

struct ImagePathMapper {
    
    private static let resourcePath = "https://image.tmdb.org/t/p/w500"
    
    private init() {}
    
    public static func buildFilepath(imagePath: String) -> String {
        return "\(resourcePath)/\(imagePath)"
    }
    
}

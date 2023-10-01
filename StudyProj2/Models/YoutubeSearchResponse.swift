//
//  YoutubeSearchResults.swift
//  StudyProj2
//
//  Created by Pratap Eknath Abhang on 19/09/23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement : Codable {
    let id : IdVideoElemnt
}

struct IdVideoElemnt: Codable{
    let kind : String
    let videoId: String
}

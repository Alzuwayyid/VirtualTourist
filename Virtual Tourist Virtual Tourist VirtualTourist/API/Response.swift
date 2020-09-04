//
//  Response.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import Foundation
/// The response data returned from the flickr API.
struct PhotoResponse: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [PhotoStruct]
}

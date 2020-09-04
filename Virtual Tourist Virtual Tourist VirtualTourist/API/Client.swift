//
//  Client.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import Foundation
import UIKit

class client{
    static let apiKey = "ae8dd2a13cbfd0f11e0ca30c85196f3a"
    static let keySecret = "5fc586bacc0bb6b1"
    
    enum endpoint {
        static let base = "https://www.flickr.com/services/rest/?method=flickr.photos.search"
        static let radius = 20
        case searchURLString(Double, Double, Int, Int)
        
        var urlString: String {
            switch self {
                 case .searchURLString(let latitude, let longitude, let perPage, let pageNum):
                   return endpoint.base + "&api_key=\(client.apiKey)" +
                         "&lat=\(latitude)" +
                         "&lon=\(longitude)" +
                         "&radius=\(endpoint.radius)" +
                         "&per_page=\(perPage)" +
                         "&page=\(pageNum)" +
                     "&format=json&nojsoncallback=1&extras=url_m"
            }
            
        }
        
        var url: URL {
              return URL(string: urlString)!
          }
    }
    
    class func getRandPageNumber(totalPicsAvailable: Int, maxNumPicsdisplayed: Int) -> Int {
        let flickrLimit = 4000
        // Available total number of pics or flickr limit
        let numberPages = min(totalPicsAvailable, flickrLimit) / maxNumPicsdisplayed
        let randomPageNum = Int.random(in: 0...numberPages)
        print("totalPicsAvaible is \(totalPicsAvailable), numPage is \(numberPages)",
             "randomPageNum is \(randomPageNum)" )
        
        return randomPageNum
    }
    
    class func getFlickrURL(latitude: Double, longitude: Double, totalPageAmount: Int = 0, picsPerPage: Int = 15) -> URL {
        
       let perPage = picsPerPage
       let pageNum = getRandPageNumber(totalPicsAvailable: totalPageAmount, maxNumPicsdisplayed: picsPerPage)
       let searchURL = endpoint.searchURLString(latitude, longitude, perPage, pageNum).url
    
        print("\n searchURL")
        return searchURL
        
    }
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type,
                                                          completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
                
            } catch {
                    print(error)

                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                
            }
         }
        
        task.resume()
        
        return task
    }
    
    
    class func getPhotos(latitude: Double, longitude: Double, totalPageAmount:  Int = 0, completion: @escaping ([PhotoStruct], Int, Error?) -> Void) -> Void {
           let url = getFlickrURL(latitude: latitude, longitude: longitude, totalPageAmount: totalPageAmount)
           let _ = taskForGETRequest(url: url, responseType: PhotoResponse.self) { response, error in
               if let response = response {
                completion(response.photos.photo, response.photos.pages, nil)
               } else {
                   completion([], 0, error)
               }
           }
       }
    
    
    class func downloadImage(img: String, completion: @escaping (Data?, Error?) -> Void) {
        let url = URL(string: img)
        
        guard let imageURL = url else {
             DispatchQueue.main.async {
                 completion(nil, nil)
             }
             return
         }
         
         let request = URLRequest(url: imageURL)
         let task = URLSession.shared.dataTask(with: request) { data, response, error in
             DispatchQueue.main.async {
                 completion(data, nil)
             }
         }
         task.resume()
    }

    
    
}
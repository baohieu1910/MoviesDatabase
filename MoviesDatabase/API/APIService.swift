//
//  APIService.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import Foundation

class APIService {
    private struct Constants {
        static let headers = [
            "X-RapidAPI-Key": "7e7df424b2msh2b4a2c3a895020bp1d7a29jsn7f2161c7c4f8",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        static let pageNumber = 5
    }
    
    
    func getData(completion: @escaping([Series]) -> ()) {
        
        var movies: [Series] = []
        
        for page in 1...Constants.pageNumber{
            let request = NSMutableURLRequest(url: NSURL(string: "https://moviesdatabase.p.rapidapi.com/titles?list=top_rated_series_250&limit=50&page=\(page)")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = Constants.headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest){ (data, response, error) -> Void in
                
                guard let data = data, error == nil else {
                    print(error?.localizedDescription)
                    return
                }
                
                do {
                    if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        let jsonData = try JSONSerialization.data(withJSONObject: dictionary["results"], options: [])
                        let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                        
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
                            movies += result
                            if page == Constants.pageNumber {
                                completion(movies)
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
            dataTask.resume()
        }
    }
    
    
}

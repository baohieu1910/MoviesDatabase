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
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDM4Nzk4MzQyZDZhZTJjYWQxNmVmNDc3YmFkY2RlZiIsInN1YiI6IjY1YjY1NmI2MGQyOTQ0MDE2NDVhYzYxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sGUXdWtRM2e55UAWHa59Aijy5Pmo3rixMBTAQD24y1s"
        ]
        
        static let pageNumber = 5
        
    }

    func getTopRatedMovie(completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
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
                        let result = try decoder.decode([Movie].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
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
    
    func getPopularMovie(completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
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
                        let result = try decoder.decode([Movie].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
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
    
    func getNowPlayingMovies(completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
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
                        let result = try decoder.decode([Movie].self, from: jsonString.data(using: .utf8)!)
                        DispatchQueue.main.async {
                            completion(result)
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

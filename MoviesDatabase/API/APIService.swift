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
        
    }

    func getTopRatedMovie(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=\(page)")! as URL,
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
    
    func getPopularMovie(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(page)")! as URL,
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
    
    func getNowPlayingMovies(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=\(page)")! as URL,
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
    
    func getUpcomingMovie(page: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=\(page)")! as URL,
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
    
    func getCastMovieList(id: Int, completion: @escaping([Cast]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?language=en-US")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["cast"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Cast].self, from: jsonString.data(using: .utf8)!)
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
    
    func getTrendingToday(completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL,
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
    
    func getTrendingThisWeek(completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/week?language=en-US")! as URL,
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
    
    func getCastDetail(id: Int, completion: @escaping(People) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/person/\(id)?language=en-US")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(People.self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieDetail(id: Int, completion: @escaping(MovieDetail) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)?language=en-US")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(MovieDetail.self, from: jsonString.data(using: .utf8)!)
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
    
    func getAiringTodaySeries(page: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/airing_today?language=en-US&page=\(page)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getOnTheAirSeries(page: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/on_the_air?language=en-US&page=\(page)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getPopularSeries(page: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/popular?language=en-US&page=\(page)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getTopRatedSeries(page: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=\(page)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getSeriesDetail(id: Int, completion: @escaping(SeriesDetail) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/\(id)?language=en-US")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(SeriesDetail.self, from: jsonString.data(using: .utf8)!)
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
    
    func getCastSeriesList(id: Int, completion: @escaping([Cast]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/\(id)/credits?language=en-US")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["cast"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Cast].self, from: jsonString.data(using: .utf8)!)
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
    
    func getSearchMoviesList(name: String, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/movie?query=\(name)&include_adult=false&language=en-US&page=1")! as URL,
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
    
    func getSearchSeriesList(name: String, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/tv?query=\(name)&include_adult=false&language=en-US&page=1")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieImages(id: Int, completion: @escaping([Images]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/images")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["backdrops"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Images].self, from: jsonString.data(using: .utf8)!)
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
    
    func getSeriesImages(id: Int, completion: @escaping([Images]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/\(id)/images")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["backdrops"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Images].self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieGenres(id: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=\(id)")! as URL,
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
    
    func getSeriesGenres(id: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=\(id)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieKeyword(id: Int, completion: @escaping([Keyword]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/keywords")! as URL,
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
                    let jsonData = try JSONSerialization.data(withJSONObject: dictionary["keywords"], options: [])
                    let jsonString = String(data: jsonData, encoding: String.Encoding.ascii)!
                    
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([Keyword].self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieKeywordList(id: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_keywords=\(id)")! as URL,
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
    
    func getSeriesKeyword(id: Int, completion: @escaping([Keyword]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/\(id)/keywords")! as URL,
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
                        let result = try decoder.decode([Keyword].self, from: jsonString.data(using: .utf8)!)
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
    
    func getSeriesKeywordList(id: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc&with_keywords=\(id)")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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
    
    func getMovieRecommendation(id: Int, completion: @escaping([Movie]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(id)/recommendations?language=en-US&page=1")! as URL,
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
    
    func getSeriesRecommendation(id: Int, completion: @escaping([Series]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/tv/\(id)/recommendations?language=en-US&page=1")! as URL,
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
                        let result = try decoder.decode([Series].self, from: jsonString.data(using: .utf8)!)
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



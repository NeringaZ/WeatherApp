//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Neringa on 23.02.21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct NetworkManager {
    
    func performRequest(method: HTTPMethod, urlComponents: URLComponents, sucess: @escaping (Data) -> Void, failure: @escaping () -> Void) {
        
        guard let url = urlComponents.url else {
            failure()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                DispatchQueue.main.async {
                    failure()
                }
                return
            }
            
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                DispatchQueue.main.async {
                    failure()
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    sucess(data)
                }
                
            } else {
                DispatchQueue.main.async {
                    failure()
                }
            }
        }
        
        task.resume()
    }
}



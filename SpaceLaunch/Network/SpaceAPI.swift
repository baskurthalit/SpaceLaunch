//
//  SpaceAPI.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


struct SpaceAPI {
    static func request<T:Codable>(endpointType: Endpoint, completion: @escaping SpaceRequestHandler<T>) {
        guard let url = endpointType.urlComponents.url else {
            completion(.error(SpaceAPIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                  let httpURLResponse = response as? HTTPURLResponse else {
                completion(.error(SpaceAPIError.dataTaskDown))
                return
            }
            
            if let data = data, httpURLResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(result: decodedData))
                } catch {
                    completion(.error(SpaceAPIError.invalidData))
                }
            } else {
                completion(.error(SpaceAPIError.badRequest))
            }
        }
        task.resume()
    }
}

enum SpaceAPIError : String, Error {
    case invalidJSON
    case invalidURL
    case dataTaskDown
    case invalidData
    case badRequest
}

//
//  SchoolService.swift
//  Practice
//
//  Created by Syed Raza on 7/31/23.
//

import Foundation
import Combine

enum APIError: Error {
    
case invalidUrl
case invalidResponse
case decodingError
    
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "InvaLID URL"
        case .decodingError:
            return "Decoding Error"
        case .invalidResponse:
            return "Decoding Error"
        }
    }
    
}
protocol SchoolServiceProtocol{
    
func fetchSchools() async throws-> [SchoolResponse]
    
}

class SchoolService : SchoolServiceProtocol {
    let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    func fetchSchools() async throws -> [SchoolResponse] {
        guard let url = URL (string: urlString) else {
            throw APIError.invalidUrl
        }
        do {
            
            let (data, response) = try await URLSession.shared.data (from: url)
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            return try JSONDecoder().decode([SchoolResponse].self, from: data)
        }catch {
            print(error)
            throw APIError.decodingError
        }
                
    }
}

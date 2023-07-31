//
//  SchoolReponse.swift
//  Practice
//
//  Created by Syed Raza on 7/31/23.
//

import Foundation

struct SchoolResponse: Decodable{
    let dbn: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
    }

    
}

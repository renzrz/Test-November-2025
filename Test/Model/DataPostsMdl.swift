//
//  DataPostsMdl.swift
//  DataPostsMdl
//
//  Created by Rz on 06/11/25.
//

import Foundation

struct dataPostsMdl: Codable, Identifiable {
    
    let userId, id: Int?
    let title, body: String?
}

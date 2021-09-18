//
//  pokemon.swift
//  Tarea_api
//
//  Created by user203110 on 9/18/21.
//

import Foundation
struct PokeFact: Codable {
let count: Int
let next: String
let previous: String
let results: [MyResult]

}


struct MyResult: Codable{
let name: String
let url: String
let id=UUID()
}

//
//  Car.swift
//  FSHW1_CarCount
//
//  Created by Дмитрий Константинов on 15.04.2021.
//

import Foundation

struct Car {
    let manufacturer: String
    let model: String
    enum body: CaseIterable {
        case SUV
        case Sedan
        case Van
        case MiniVan
        case MicroVan
        case Cabriolet
        case Targa
        case Coupe
        
        static var count: Int { return body.Coupe.hashValue + 1}
    }
    let yearOfIssue: Int
    let carNumber: String
}

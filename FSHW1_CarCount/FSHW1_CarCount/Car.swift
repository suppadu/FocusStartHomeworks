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
    let body: Body
    enum Body: String, CaseIterable {
        case SUV
        case Sedan
        case Van
        case Coupe
        case Hatch
    }
    let yearOfIssue: Int
    let carNumber: String
}

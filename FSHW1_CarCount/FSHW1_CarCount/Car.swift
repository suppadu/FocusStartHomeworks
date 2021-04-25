//
//  Car.swift
//  FSHW1_CarCount
//
//  Created by Дмитрий Константинов on 15.04.2021.
//

import Foundation

struct Car {
    enum Body: String, CaseIterable {
        case suv
        case sedan
        case van
        case coupe
        case hatch
    }
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int
    let carNumber: String
}

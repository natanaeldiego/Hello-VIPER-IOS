//
//  SprintData.swift
//  HelloViper
//
//  Created by Natanael Diego on 21/06/21.
//

import Foundation

// MARK: - SprintDatum
struct SprintDatum: Codable {
    let id: Int
    let nome: String
    let link: String
}

typealias SprintData = [SprintDatum]

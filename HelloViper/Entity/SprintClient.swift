//
//  SprintClient.swift
//  HelloViper
//
//  Created by Natanael Diego on 21/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct SprintClient {
    static let kBaseURL = "https://scrum-deck-backend.herokuapp.com"
    
    static func getSprint() -> Observable<SprintData> {
        return RxAlamofire.requestDecodable(.get, "\(kBaseURL)/sprint")
            .map { (response, sprint: SprintData) in
                debugPrint("Resultado list: \(sprint)")
                return sprint
            }
    }
}

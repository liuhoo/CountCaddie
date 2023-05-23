//
//  ScorecardModel.swift
//  CountCaddie
//
//  Created by Alex Liu on 5/15/23.
//

import Foundation

struct ScorecardModel: Hashable, Codable, Identifiable {
    
    var id: String
    var description: String
    var holes = [HoleModel]()
    var currHole: Int = 0
    var totScore : Int = 0
    struct HoleModel: Hashable, Codable, Identifiable{
        var id: Int
        var FairwayHit: String?
        var GreenHit: Bool?
        var Putts = [Putt]()
        var Score: Int = 0
        var Par: Int = 0
        struct Putt: Hashable, Codable, Identifiable{
            var id: Int
            var Break: String?
            var Miss: String?
            var Make: Bool?
        }

        
    }
}





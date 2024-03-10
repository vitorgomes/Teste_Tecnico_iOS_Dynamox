//
//  ScoreDataModel.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 10/03/24.
//

import Foundation
import RealmSwift

class ScoreDataModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var userName: String
    @Persisted var score: Int
    
    override class func primaryKey() -> String? {
        "id"
    }
}

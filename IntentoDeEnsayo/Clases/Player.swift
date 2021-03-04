//
//  Player.swift
//  IntentoDeEnsayo
//
//  Created by Ariana Esquivel on 03/03/21.
//

import UIKit

class Player: Codable {
    var username:String!
    var puntaje:Int!
    
    init(_ username:String,_ puntaje:Int) {
        self.username = username
        self.puntaje = puntaje
    }
    
    func store(){
        
    }
    
    func getPlayers() -> [Player]{
        if let data = App.shared.defaults.object(forKey: "players") as? Data{
            let decoder = JSONDecoder()
            guard let players = try? decoder.decode([Player].self, from: data) else { fatalError("No se ha logrado hacer el parseo")
            }
            return players
        }
        return [Player]()
    }
}

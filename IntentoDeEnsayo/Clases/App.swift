//
//  App.swift
//  IntentoDeEnsayo
//
//  Created by Ariana Esquivel on 03/03/21.
//

import UIKit

class App: NSObject {
    static let shared = App()
    let defaults = UserDefaults.standard
    var users = [User]()
    var players = [Player]()
}

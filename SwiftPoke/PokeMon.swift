//
//  PokeMon.swift
//  SwiftPoke
//
//  Created by kengo kato on 2020/08/08.
//  Copyright © 2020 K K. All rights reserved.
//

import UIKit

struct PokeMon: Codable {
    var id: Int
    var name: CountryName
    var type: Array<String>
    var status: Status
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case type
      case status = "base"
    }
}

struct CountryName: Codable {
    var english: String
    var japanese: String
    var chinese: String
    var french: String
}

struct Status: Codable {
    var hp: Int
    var attack: Int
    var defense: Int
    var spAttack: Int
    var spDefense: Int
    var speed: Int
    
    enum CodingKeys: String, CodingKey {
      case hp = "HP"
      case attack = "Attack"
      case defense = "Defense"
      case spAttack = "Sp. Attack"
      case spDefense = "Sp. Defense"
      case speed = "Speed"
    }
}

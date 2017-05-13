//
//  Pokemon.swift
//  Pokedex
//
//  Created by NK on 11.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String = ""
    private var _type: String = ""
    private var _defense: String = ""
    private var _height: String = ""
    private var _weight: String = ""
    private var _attack: String = ""
    private var _nextEvolutionTxt: String = ""
    private var _nextEvolutionName: String = ""
    private var _nextEvolutionId: String = ""
    private var _nextEvolutionLevel: String = ""
    private var _pokemonURL: String!
    
    var description: String {
        return _description
    }
    
    var type: String {
        return _type
    }
    
    var defense: String {
        return _defense
    }
    
    var height: String {
        return _height
    }
    
    var weight: String {
        return _weight
    }
    
    var attack: String {
        return _attack
    }
    
    var nextEvolutionTxt: String {
        return _nextEvolutionTxt
    }
    
    var nextEvolutionName: String {
        return _nextEvolutionName
    }
    
    var nextEvolutionId: String {
        return _nextEvolutionId
    }

    var nextEvolutionLevel: String {
        return _nextEvolutionLevel
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        _name = name
        _pokedexId = pokedexId
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String, Any> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        Alamofire.request("\(URL_BASE)\(url)").responseJSON(completionHandler: { response in
                            if let dict = response.result.value as? Dictionary<String, Any> {
                                if let desc = dict["description"] as? String {
                                    let newDesc = desc.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._description = newDesc
                                }
                            }
                            completed()
                        })
                    }
                }
                if let evolutions = dict["evolutions"] as? [Dictionary<String, Any>], evolutions.count > 0 {
                    if let nextEvo = evolutions[0]["to"] as? String {
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvo
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoId = newString.replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionId = nextEvoId
                            }
                            if let level = evolutions[0]["level"] as? Int {
                                self._nextEvolutionLevel = "\(level)"
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
    
}

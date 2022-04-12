//
//  PokemonStore.swift
//  LearningTask-6.5
//
//  Created by rafael.rollo on 11/04/2022.
//

import Foundation

protocol PokemonStore: AnyObject {
    var todos: [Pokemon] { get }
}

class PokemonLocalPersistence: PokemonStore {
    var todos: [Pokemon]
    
    init() {
        let pokemons = [
            Pokemon(referencia: "001", nome: "Bulbasaur", tipo: [.grama, .venenoso], evolucoes: [
                Pokemon(referencia: "002", nome: "Ivysaur", tipo: [.grama, .venenoso])
            ]),
            Pokemon(referencia: "002", nome: "Ivysaur", tipo: [.grama, .venenoso], evolucoes: [
                Pokemon(referencia: "003", nome: "Venusaur", tipo: [.grama, .venenoso])
            ]),
            Pokemon(referencia: "003", nome: "Venusaur", tipo: [.grama, .venenoso]),
            
            Pokemon(referencia: "004", nome: "Charmander", tipo: [.fogo], evolucoes: [
                Pokemon(referencia: "005", nome: "Charmeleon", tipo: [.fogo])
            ]),
            Pokemon(referencia: "005", nome: "Charmeleon", tipo: [.fogo], evolucoes: [
                Pokemon(referencia: "006", nome: "Charizard", tipo: [.fogo, .voador])
            ]),
            Pokemon(referencia: "006", nome: "Charizard", tipo: [.fogo, .voador]),
            
            Pokemon(referencia: "007", nome: "Squirtle", tipo: [.agua], evolucoes: [
                Pokemon(referencia: "008", nome: "Wartortle", tipo: [.agua])
            ]),
            Pokemon(referencia: "008", nome: "Wartortle", tipo: [.agua], evolucoes: [
                Pokemon(referencia: "009", nome: "Blastoise", tipo: [.agua])
            ]),
            Pokemon(referencia: "009", nome: "Blastoise", tipo: [.agua]),
            
            Pokemon(referencia: "025", nome: "Pikachu", tipo: [.eletrico], evolucoes: [
                Pokemon(referencia: "026", nome: "Raichu", tipo: [.eletrico])
            ]),
            Pokemon(referencia: "026", nome: "Raichu", tipo: [.eletrico]),
            
            Pokemon(referencia: "133", nome: "Eevee", tipo: [.normal], evolucoes: [
                Pokemon(referencia: "134", nome: "Vaporeon", tipo: [.agua]),
                Pokemon(referencia: "135", nome: "Jolteon", tipo: [.eletrico]),
                Pokemon(referencia: "136", nome: "Flareon", tipo: [.fogo]),
            ]),
            Pokemon(referencia: "134", nome: "Vaporeon", tipo: [.agua]),
            Pokemon(referencia: "135", nome: "Jolteon", tipo: [.eletrico]),
            Pokemon(referencia: "136", nome: "Flareon", tipo: [.fogo]),
            
            Pokemon(referencia: "144", nome: "Articuno", tipo: [.gelo, .voador]),
            Pokemon(referencia: "145", nome: "Zapdos", tipo: [.eletrico, .voador]),
            Pokemon(referencia: "146", nome: "Moltres", tipo: [.fogo, .voador]),
            
            Pokemon(referencia: "150", nome: "Mewtwo", tipo: [.psiquico]),
            Pokemon(referencia: "151", nome: "Mew", tipo: [.psiquico]),
        ]
        
        self.todos = pokemons
    }
}

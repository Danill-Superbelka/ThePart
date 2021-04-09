//
//  LevelController.swift
//  Puzzle
//
//  Created by Даниил  on 30.03.2021.
//

import Combine

class LevelController: ObservableObject{
    @Published var levels = [
        Level(levelName: "T", levelNumber: 0, levelComplete: false, levelAvailable: true),
        Level(levelName: "M", levelNumber: 1, levelComplete: false, levelAvailable: true),
        Level(levelName: "H", levelNumber: 2, levelComplete: false, levelAvailable: false),
      
    ]
    
}

struct Level: Hashable {
    let levelName: String
    let levelNumber: Int
    var levelComplete: Bool
    var levelAvailable: Bool
}

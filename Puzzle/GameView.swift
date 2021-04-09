//
//  GameView.swift
//  Puzzle
//
//  Created by Даниил  on 31.03.2021.
//

import SwiftUI
import SpriteKit

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct GameView: View {
    @Binding var isGameSceneShowing: Bool
    @Binding var level: Level
    
    var body: some View{
    
        ZStack(alignment: .top) {
            
            SpriteView(scene: SKScene(fileNamed: level.levelName)!)
                .ignoresSafeArea()
            
                HStack(alignment: .top){
                    Button(action: { isGameSceneShowing.toggle()}) {
                        Text("Меню")
                            .padding()
                    }
                    Spacer()
                    Text("\(level.levelName)")
                        .padding()
                    Spacer()
                    Spacer()
                }
        } .ignoresSafeArea()

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isGameSceneShowing: Binding.constant(true), level: Binding.constant(Level(levelName: "T", levelNumber: 0, levelComplete: false, levelAvailable: true)))
    }
}


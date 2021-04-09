//
//  ContentView.swift
//  Puzzle
//
//  Created by Даниил  on 21.01.2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @ObservedObject var gameData = LevelController()
    @State private var isGameSceneShowing = false
    @State private var gameSoundMenu: AVAudioPlayer?
    @State private var selectedLevel = Level(levelName: "", levelNumber: 0, levelComplete: false, levelAvailable: false)
    
    let layout = [GridItem(.adaptive(minimum: 160))]
    //Звук выбора уровня    let path = Bundle.main.path(forResource: <#T##String?#>, ofType: <#T##String?#>)
    
    var body: some View{
        VStack {
            Text("The Part")
                .padding()
            ScrollView (showsIndicators: false){
                LazyVGrid(columns: layout, spacing: 31){
                    ForEach(gameData.levels, id: \.levelNumber) { level in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 160)
                                .overlay(
                                    (LevelLockOverlay(level: level)),
                                    alignment: .topTrailing
                                )
                                .border(Color.black)
                                
                            
                            Text("\(level.levelName)")
                                .font(.largeTitle)
                                .fontWeight(.ultraLight)
                                .foregroundColor(Color.black)
                        }
                        .padding()
                        .onTapGesture {
                            selectedLevel = level
                            if selectedLevel.levelAvailable{
                                isGameSceneShowing.toggle()
                            }
                        }
                        .fullScreenCover(isPresented: $isGameSceneShowing){
                           GameView(isGameSceneShowing: $isGameSceneShowing, level: $selectedLevel)
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
    
}

struct LevelLockOverlay: View {
    let level: Level
    var body: some View {
        if !level.levelAvailable{
            Text("Buy")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.blue)
        } else {
            EmptyView()
        }
    }
}



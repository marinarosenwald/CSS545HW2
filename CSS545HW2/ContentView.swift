//
//  ContentView.swift
//  CSS545HW2
//
//  Created by Mari Rosenwald on 4/19/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @AppStorage ("tapCount") private var tapCount = 0
    @AppStorage ("viewMode") private var viewMode = false
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(viewMode ? Color.black : Color.white)
                    .frame(width: 300, height: 400)
                    .cornerRadius(10)
                    .padding()
                
                Button("Play Sound! \n This is tap number \(tapCount)") {
                    tapCount += 1
                    if let soundURL = Bundle.main.url(forResource: "movie_noise", withExtension: "mp3") {
                        var mySound: SystemSoundID = 0
                        AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
                        AudioServicesPlaySystemSound(mySound);
                    }
                    
                }
                .frame(width: 200, height: 100)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            
                
            }
            Toggle("Dark Mode", isOn: $viewMode)
                .padding()
                .onChange(of: viewMode) {
//                    if let windowScene = UIApplication.shared.connectedScenes
//                        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
//                        if viewMode {
//                            windowScene.windows.forEach { window in
//                                window.overrideUserInterfaceStyle = .dark
//                            }
//                        } else {
//                            windowScene.windows.forEach { window in
//                                window.overrideUserInterfaceStyle = .light
//                            }
//                        }
//                    }
                }
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

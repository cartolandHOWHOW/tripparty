//
//  ContentView.swift
//  EasyTrip
//
//  Created by max on 2025/6/25.
//
import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("ForMenu")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    Text("旅遊派對")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 10)

                    NavigationLink(destination: TruthOrDareView()) {
                        Text("開始遊戲")
                    }
                    .buttonStyle(MainMenuButtonStyle())

                    Button("遊戲說明") { }
                        .buttonStyle(MainMenuButtonStyle())
                    Button("設定") { }
                        .buttonStyle(MainMenuButtonStyle())
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct MainMenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 45)
            .background(Color.brown)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: configuration.isPressed ? 2 : 6)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
}

#Preview {
    MenuView()
}

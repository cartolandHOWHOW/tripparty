//
//  SpinWheelView.swift
//  TripParty
//
//  Created by max on 2025/6/25.
//

import SwiftUI

struct SpinWheelView: View {
    let mode: String
    @State private var angle: Double = 0
    @State private var selectedIndex: Int? = nil
    
    // 題目列表（可依模式切換不同題目）
    var options: [String] {
        if mode == "真心話" {
            return [
                "你最喜歡的人是誰？",
                "說出一個不為人知的秘密",
                "你曾經說過最大的謊是什麼？",
                "你最害怕什麼？",
                "描述你第一次戀愛的經驗",
                "最近一次尷尬的時刻是什麼？"
            ]
        } else {
            return [
                "跳一段舞",
                "模仿一位名人",
                "用左手畫一隻貓",
                "講笑話讓大家笑出來",
                "用動物聲音說一句話",
                "用外星人聲音說你愛我"
            ]
        }
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(mode) 模式")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            ZStack {
                // 轉盤
                ForEach(0..<6) { i in
                    SectorView(text: options[i], index: i)
                }
                .rotationEffect(.degrees(angle))
                .animation(.easeOut(duration: 2), value: angle)
                
                // 指針（三角形）
                Triangle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                    .offset(y: -110)
                    .rotationEffect(.degrees(0))
            }
            .frame(width: 250, height: 250)
            
            // 按鈕
            Button("開始旋轉") {
                let spinRounds = Double.random(in: 3...6)
                let newAngle = angle + spinRounds * 360
                angle = newAngle
                
                // 根據角度計算選中哪一題
                let degreesPerSlice = 360.0 / Double(options.count)
                let index = Int((360 - newAngle.truncatingRemainder(dividingBy: 360)) / degreesPerSlice) % options.count
                selectedIndex = index
            }
            .padding()
            .frame(width: 160, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: 5)
            
            if let index = selectedIndex {
                Text("🎯 題目：\(options[index])")
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
            }
            
            Spacer()
        }
    }
}

struct SectorView: View {
    let text: String
    let index: Int

    var body: some View {
        let angle = Double(index) / 6 * 360

        return Text(text)
            .font(.caption)
            .foregroundColor(.black)
            .rotationEffect(.degrees(angle))
            .offset(y: -100)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let tip = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.minX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.maxY)
        path.move(to: tip)
        path.addLines([left, right, tip])
        return path
    }
}

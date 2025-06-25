//
//  TruthOrDareView.swift
//  TripParty
//
//  Created by max on 2025/6/25.
//
//
//  TruthOrDareView.swift
//  EasyTrip
//
//  Created by max on 2025/6/25.
//
import SwiftUI

struct TruthOrDareView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("真心話大冒險")
                .font(.largeTitle)
                .bold()

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                NavigationLink(destination: SpinWheelView(mode: "真心話")) {
                    CardView(title: "真心話", color: .pink)
                }

                NavigationLink(destination: SpinWheelView(mode: "大冒險")) {
                    CardView(title: "大冒險", color: .orange)
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(width: 140, height: 140)
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
    }
}
struct SpinWheelView: View {
    let mode: String
    @State private var angle: Double = 0
    @State private var selectedIndex: Int? = nil

    let options = [
        "你最喜歡的旅行地點？", "分享一次尷尬的經驗", "唱一首歌", "模仿某個人",
        "透露一個秘密", "跳一段舞"
    ]

    var body: some View {
        VStack(spacing: 40) {
            Text("\(mode)模式")
                .font(.title)
                .bold()

            ZStack {
                ForEach(0..<6) { i in
                    Text(options[i])
                        .rotationEffect(.degrees(Double(i) / 6 * 360))
                        .offset(y: -100)
                }

                Triangle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                    .offset(y: -120)
            }
            .frame(width: 250, height: 250)
            .rotationEffect(.degrees(angle))
            .animation(.easeOut(duration: 3), value: angle)

            Button("開始旋轉") {
                let randomSpin = Double.random(in: 3...6)
                let newAngle = angle + randomSpin * 360
                angle = newAngle

                let index = Int(newAngle.truncatingRemainder(dividingBy: 360) / 60) % 6
                selectedIndex = index
            }

            if let index = selectedIndex {
                Text("🎉 題目：\(options[index])")
                    .font(.title3)
                    .foregroundColor(.purple)
                    .padding()
            }
        }
        .padding()
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


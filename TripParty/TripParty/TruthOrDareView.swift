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


//
//  Loading.swift
//  FilmCatalogue
//
//  Created by ReynardVN8 on 22/10/22.
//

import Foundation
import SwiftUI

struct Loading: View {
    @State var spinnerStart: CGFloat = 0.0
    @State var spinnerEndS1: CGFloat = 0.10
    @State var rotationDegreeS1 = initialDegree
    @State var isLoading = true
    static let initialDegree: Angle = .degrees(270)
    let rotationTime: Double = 1.0
    let animationTime: Double = 1.0
    let fullRotation: Angle = .degrees(360)
    
    var body: some View {
        ZStack(){
            HStack(alignment: .center){
                Spacer()
                VStack(alignment: .center){
                    Spacer()
                    SpinningCircle(start: spinnerStart, end: spinnerEndS1, rotation: rotationDegreeS1, color: .lightYellow)
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                Spacer()
            }
        }
        .animation(.default, value: isLoading)
        .background(Color.black)
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: animationTime, repeats: true) { (mainTimer) in
                self.animateSpinner()
            }
            /*
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isLoading = false
                }
            }
             */
        }
    }
    
    func animateSpinner(with timeInterval: Double, completion: @escaping (() -> Void)) {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: rotationTime)) {
                completion()
            }
        }
    }

    func animateSpinner() {
        animateSpinner(with: (rotationTime * 2) - 0.025) {
            self.rotationDegreeS1 += fullRotation
        }
    }
}

struct SpinningCircle: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .fill(Color.lightGrey.opacity(0.2))
            Circle()
                .trim(from: start, to: end)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .fill(color)
                .rotationEffect(rotation)
                
        }
    }
}

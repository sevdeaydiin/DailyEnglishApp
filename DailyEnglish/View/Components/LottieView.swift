//
//  LottieView.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/20/25.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let animationName: String
    let loopMode: LottieLoopMode?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let animationView = LottieAnimationView()
        
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode!
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        let widthConstraint = animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        widthConstraint.isActive = true

        let heightConstraint = animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightConstraint.isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

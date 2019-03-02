//
//  ViewController.swift
//  AnimatedGradient
//
//  Created by Tri Vo on 3/2/19.
//  Copyright © 2019 Tri Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet private weak var viewContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupGradient() {
        viewContainer.backgroundColor = .clear
        
        let mainView = UIView.init(frame: viewContainer.bounds)
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 1.0)
        gradientLayer.frame = mainView.bounds
        
        mainView.layer.addSublayer(gradientLayer)
        viewContainer.addSubview(mainView)
        
        
    
        let newColors = [UIColor.purple, UIColor.orange].map { $0.cgColor }
        
        let colorsAnimation = CABasicAnimation.init(keyPath: #keyPath(CAGradientLayer.colors))
        colorsAnimation.fromValue = gradientLayer.colors
        colorsAnimation.toValue = newColors
        colorsAnimation.duration = 2.0
        colorsAnimation.delegate = self
        colorsAnimation.fillMode = .forwards
        colorsAnimation.isRemovedOnCompletion = false
        gradientLayer.add(colorsAnimation, forKey: "colors")
        
    }

    func animationDidStart(_ anim: CAAnimation) {
        print("Animation start")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("animation stop")
    }

}


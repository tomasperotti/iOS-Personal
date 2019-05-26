//
//  MainViewController.swift
//  project1-foodrecipes
//
//  Created by Tomas Mateo Perotti on 17/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit
import Lottie
class MainViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var animationView: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimations()
    }

    func startAnimations() {
        animationView.animation = Animation.named("noodles")
        animationView.loopMode = .autoReverse
        animationView.play(fromProgress: 0.10, toProgress: 0.50, loopMode: nil, completion: nil)
    }

}

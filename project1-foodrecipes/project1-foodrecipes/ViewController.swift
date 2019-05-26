//
//  ViewController.swift
//  project1-foodrecipes
//
//  Created by Tomas Mateo Perotti on 15/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit
import Alamofire
import Lottie

class ViewController: UIViewController {

    @IBOutlet var questionTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet var progressBarAnimation: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarAnimation.backgroundColor = nil
    }

    @IBAction func submitQuestion(_ sender: Any) {
        guard let question = questionTextField.text else {
            return
        }
        progressBarAnimation.isHidden = false
        progressBarAnimation.animation = Animation.named("progress_bar")
        progressBarAnimation.contentMode = .scaleAspectFill
        progressBarAnimation.play()
        fillAnswerLabel(question: question)
    }
    
    func fillAnswerLabel(question: String){
        var answer: NutritionAnswer?
            
        FoodService().getFoodAnswer(question: question) { ans in
            answer = ans
            self.progressBarAnimation.stop()
            self.progressBarAnimation.isHidden = true
            self.answerLabel.text = answer?.answer
        }
    }
    

}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

//
//  LoginView.swift
//  project3-tracker
//
//  Created by Tomas Mateo Perotti on 27/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LoginView: UIView {
    
    var contentView: UIView?
    @IBInspectable var nibName: String?
    var delegate: LoginViewDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    @IBAction func btnActionSignUp(_ sender: Any) {
        delegate?.tappedOnSignUp()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }

    @IBAction func btnActionSignIn(_ sender: Any) {
        delegate?.tappedOnSignIn()
    }
}

protocol LoginViewDelegate {
    func tappedOnSignUp()
    func tappedOnSignIn()
}

//
//  BSSecureView.swift
//  BSSecureView
//
//  Created by BangsS00 on 9/4/25.
//

import UIKit

public final class BSSecureView: UIView {
    private let secureField = UITextField()
    private let contentView = UIView()
    
    public var isSecure: Bool {
        get {
            self.secureField.isSecureTextEntry
        }
        set {
            self.secureField.isSecureTextEntry = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSecureOverlay()
    }
    
    public required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupSecureOverlay() {
        self.secureField.isSecureTextEntry = true
        self.secureField.isUserInteractionEnabled = false
        self.secureField.backgroundColor = .clear
        self.secureField.textColor = .clear
        self.secureField.tintColor = .clear
        self.secureField.isAccessibilityElement = false
        
        DispatchQueue.main.async {
            self.insertSubview(self.secureField, at: 0)
            self.addSubview(self.contentView)
            
            self.contentView.layer.superlayer?.addSublayer(self.secureField.layer)
            self.secureField.layer.sublayers?.last?.addSublayer(self.contentView.layer)
            
            self.secureField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.secureField.topAnchor.constraint(equalTo: self.topAnchor),
                self.secureField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.secureField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.secureField.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
            
            self.contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
                self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }
}

extension BSSecureView {
    public func embed(_ view: UIView) {
        DispatchQueue.main.async {
            self.contentView.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            ])
        }
    }
    
    public func setSecure(_ isSecure: Bool) {
        self.isSecure = isSecure
    }
}

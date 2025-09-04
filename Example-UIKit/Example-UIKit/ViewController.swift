//
//  ViewController.swift
//  Example-UIKit
//
//  Created by BangS00 on 9/4/25.
//

import UIKit
import BSSecureKit

class ViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    // UILabel for comparison
    private lazy var visibleContentLabel: UILabel = {
        let view = UILabel()
        view.text = "This is visible content"
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.orange
        return view
    }()
    // Basic secure content example
    private lazy var secureContentView: BSSecureView = {
        let view = BSSecureView()
        return view
    }()
    private lazy var secureContentLabel: UILabel = {
        let view = UILabel()
        view.text = "This is secure content"
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.green
        return view
    }()
    // Placeholder example
    private lazy var placeholderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    private lazy var placeholderSecureView: BSSecureView = {
        let view = BSSecureView()
        return view
    }()
    private lazy var placeholderLabel: UILabel = {
        let view = UILabel()
        view.text = "This is placeholder"
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.red
        return view
    }()
    private lazy var placeholderContentLabel: UILabel = {
        let view = UILabel()
        view.text = "This is secure content"
        view.textColor = UIColor.black
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    // Toggle isSecure
    private lazy var toggleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        let view = UIButton()
        view.configuration = config
        view.setTitle("Secured", for: .normal)
        view.setTitle("Not Secured", for: .selected)
        view.addTarget(self, action: #selector(touchUpInsideToggleButton(_:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    private func setup() {
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.visibleContentLabel)
        self.stackView.addArrangedSubview(self.secureContentView)
        self.stackView.addArrangedSubview(self.placeholderView)
        self.view.addSubview(self.toggleButton)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        self.toggleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.toggleButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            self.toggleButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.toggleButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.toggleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.toggleButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Basic secure content example
        self.secureContentView.embed(self.secureContentLabel)
        
        // Placeholder example
        self.placeholderView.addSubview(self.placeholderLabel)
        self.placeholderView.addSubview(self.placeholderSecureView)
        self.placeholderSecureView.embed(self.placeholderContentLabel)
        
        self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.placeholderLabel.topAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.topAnchor),
            self.placeholderLabel.leadingAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.leadingAnchor),
            self.placeholderLabel.trailingAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.trailingAnchor),
            self.placeholderLabel.bottomAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.bottomAnchor)
        ])
        self.placeholderSecureView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.placeholderSecureView.topAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.topAnchor),
            self.placeholderSecureView.leadingAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.leadingAnchor),
            self.placeholderSecureView.trailingAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.trailingAnchor),
            self.placeholderSecureView.bottomAnchor.constraint(equalTo: self.placeholderView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func touchUpInsideToggleButton(_ sender: UIButton) {
        // Using variable
        self.secureContentView.isSecure = sender.isSelected
        // Using function
        self.placeholderSecureView.setSecure(sender.isSelected)
        sender.isSelected.toggle()
    }
}


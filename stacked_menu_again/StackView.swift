//
//  StackView.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-02.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class StackView: UIView {

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var body: String? {
        didSet {
            textView.text = body
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = FontManager.menuHeader()
        return label
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = UIColor.clear
        view.textColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 18)
        view.textAlignment = .justified
        return view
    }()
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        button.setTitle("X", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = button.frame.width / 2
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    init(with superView: UIView) {
        super.init(frame: superView.bounds)
        
        setupLayer()
        setupSubviews()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayer() {
        
        backgroundColor = ColorManager.customStackViewBlue()
        layer.cornerRadius = 8
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
        
    }
    
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textView)
        addSubview(button)
        
        addConstraints(withFormat: "H:|[v0]|", toViews: [titleLabel])
        addConstraints(withFormat: "H:|-16-[v0]-16-|", toViews: [textView])
        addConstraints(withFormat: "V:|-16-[v0(30)]-8-[v1(350)]-8-[v2(55)]", toViews: [titleLabel, textView, button])
        button.widthAnchor.constraint(equalToConstant: 55).isActive = true
        addConstraint(NSLayoutConstraint(item: self.button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        button.alpha = 0
        textView.alpha = 0        
    }
    
    func buttonPressed() {
        print("button pressed!!")
    }
    

}

//
//  StackView.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-02.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class StackView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.text = "Creme Brulle"
        label.textAlignment = .center
        label.font = FontManager.headerFont()
        return label
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.blue
        view.text = PlaceHolderText.textViewText()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .justified
        return view
    }()
    
    init(with superView: CGRect) {
        super.init(frame: superView)
        
        self.backgroundColor = ColorManager.customStackViewBlue()
        
        setupSubviews()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textView)
        
        addConstraints(withFormat: "H:|[v0]|", toViews: [titleLabel])
        addConstraints(withFormat: "H:|-16-[v0]-16-|", toViews: [textView])
        addConstraints(withFormat: "V:|-30-[v0(30)-8-[v1(350)]", toViews: [titleLabel, textView])
        
    }
    

}

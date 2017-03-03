//
//  ViewController.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-02.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "healthy_recipes")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = ColorManager.customDarkBlueGray()
        label.text = "Fresh Flavours"
        label.textAlignment = .left
        label.font = FontManager.headerFont()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundViews()
        
        let offset = 250
        addMenuViews(with: offset)
    }
    
    func setupBackgroundViews() {
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        
        let height = Int(view.bounds.height * 0.66)
        view.addConstraints(withFormat: "H:|[v0]|", toViews: [backgroundImageView])
        view.addConstraints(withFormat: "V:|[v0(\(height))]", toViews: [backgroundImageView])
        
        let leftMargin = Int(view.bounds.width * 0.4)
        view.addConstraints(withFormat: "H:|-\(leftMargin)-[v0]|", toViews: [titleLabel])
        view.addConstraints(withFormat: "V:|-70-[v0(30)]", toViews: [titleLabel])
    }
    
    func addMenuViews(with offset: Int)  {
        
        
        
        var menuView = StackView(with: self.view.bounds)
        //menuView.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        view.addSubview(menuView)
    
    }


}


//
//  Helpers.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-02.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraints(withFormat format: String, toViews views: [UIView]) {

        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let formatString = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[formatString] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

struct ColorManager {
    
    static func customDarkBlueGray() -> UIColor {
        return UIColor(red: 54/255, green: 73/255, blue: 78/255, alpha: 1)
    }
    
    static func customStackViewBlue() -> UIColor {
        return UIColor(red: 89/255, green: 112/255, blue: 129/255, alpha: 1)
    }
    
}

struct FontManager {
    
    static func headerFont() -> UIFont {
        return UIFont(name: "HiraginoSans-W6", size: 30)!
    }
}

struct PlaceHolderText {
    
    static func textViewText() -> String {
        let string: String = "1. Fill large pot about 2/3 full with water, salt it liberally and bring to a boil over high heat \n\n2. Meanwhile, heat a wide, deep heavy skillet over medium heat. Pour in the olive oil until it is shimmering and almost smoking. Add the garlic, anchovies, onions and capers and cook, stirring with a wooden spoon, until the onions are softened but not browned, about 4 minutes. Pour in the wine and bring to a simmer, then lower the heat and simmer until the wine has almost completely evaporated, about 5 minutes."
        
        return string
    }
    
}


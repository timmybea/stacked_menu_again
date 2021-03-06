//
//  RecipeData.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-03.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class RecipeData: NSObject {
    
    class func getRecipes() -> [Recipe] {
        
        let puttanesca = Recipe(with: "Puttanesca", body: "1. Fill large pot about 2/3 full with water, salt it liberally and bring to a boil over high heat \n\n2. Meanwhile, heat a wide, deep heavy skillet over medium heat. Pour in the olive oil until it is shimmering and almost smoking. Add the garlic, anchovies, onions and capers and cook, stirring with a wooden spoon, until the onions are softened but not browned, about 4 minutes. Pour in the wine and bring to a simmer, then lower the heat and simmer until the wine has almost completely evaporated, about 5 minutes.")
        
        let slowChicken = Recipe(with: "Slow-Cooker Balsamic Chicken", body: "1. In a large slow cooker, add Brussels sprouts and potatoes in an even layer and place chicken on top. \n2. In a small bowl, whisk together balsamic vinegar, chicken broth, brown sugar, mustard, dried thyme, rosemary, and oregano, and crushed red pepper flakes. Season generously with salt and pepper.\n3. Pour marinade over chicken and vegetables. Scatter all over with garlic.\n4. Cover and cook on high until chicken is fall-apart tender, 4 1/2 to 5 hours.\n5. Garnish with parsley and serve with the juices.")
        
        return [puttanesca, slowChicken]
    }
}

struct Recipe {
    
    let title: String!
    let body: String!
    
    init(with title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}

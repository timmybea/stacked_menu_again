//
//  ViewController.swift
//  stacked_menu_again
//
//  Created by Tim Beals on 2017-03-02.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stackViews = [StackView]()
    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    var snap: UISnapBehavior?
    var isDragging = false
    var previousPosition: CGPoint?
    var isViewSnapped = false
    
    
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
        setupDynamicAnimator()
        
        var offset: CGFloat = 300
        let recipes = RecipeData.getRecipes()
        
        for recipe in recipes {
            addMenuViews(with: offset, recipe: recipe)
            offset -= 50
        }
        
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
    
    func addMenuViews(with offset: CGFloat, recipe: Recipe)  {
        
        let stackView = StackView(with: self.view)
        stackView.title = recipe.title
        stackView.body = recipe.body
        
        stackView.frame = self.view.bounds.offsetBy(dx: 0, dy: self.view.bounds.size.height - offset)
        
        view.addSubview(stackView)
        
        //pan Gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(panRecognizer:)))
        stackView.addGestureRecognizer(panGesture)

        //collision behavior
        let collisionBehavior = UICollisionBehavior(items: [stackView])
        
        //lower boundary
        let boundaryY = stackView.frame.origin.y + stackView.frame.height
        let boundaryStart = CGPoint(x: 0, y: boundaryY)
        let boundaryEnd = CGPoint(x: stackView.frame.width, y: boundaryY)
        collisionBehavior.addBoundary(withIdentifier: 1 as NSCopying, from: boundaryStart, to: boundaryEnd)
        dynamicAnimator.addBehavior(collisionBehavior)
        
        gravityBehavior.addItem(stackView)
        
        stackViews.append(stackView)
    }

    func setupDynamicAnimator() {
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        gravityBehavior = UIGravityBehavior()
        gravityBehavior.magnitude = 4
        dynamicAnimator.addBehavior(gravityBehavior)
    }
    
    func handlePan(panRecognizer: UIPanGestureRecognizer) {
        
        let currentPosition = panRecognizer.location(in: self.view)
        
        if let dragView = panRecognizer.view {
            if panRecognizer.state == .began {
                let isTouchNearTop = panRecognizer.location(in: dragView).y < 150
                
                if isTouchNearTop {
                    isDragging = true
                    previousPosition = currentPosition
                }
            } else if panRecognizer.state == .changed && isDragging {
                if let previousPosition = previousPosition {
                    let offset = previousPosition.y - currentPosition.y
                    dragView.center = CGPoint(x: dragView.center.x, y: dragView.center.y - offset)
                }
                previousPosition = currentPosition
            } else if panRecognizer.state == .ended && isDragging {
                
                snap(dragView: dragView)
                
                //Applies behavior to the dynamic item again. Makes it adhere to gravity etc.
                dynamicAnimator.updateItem(usingCurrentState: dragView)
                
                isDragging = false
            }
        }
    }
    
    func snap(dragView: UIView) {
        
        let viewHasNearedSnapPosition = dragView.frame.origin.y < 130
        
        if viewHasNearedSnapPosition {
            if !isViewSnapped {
                var snapPosition = view.center
                snapPosition.y += 120
                
                snap = UISnapBehavior(item: dragView, snapTo: snapPosition)
                dynamicAnimator.addBehavior(snap!)
                
                changeStackViewAlpha(currentView: dragView)
                
                isViewSnapped = true
            }
        } else {
            if isViewSnapped {
                dynamicAnimator.removeBehavior(snap!)
                changeStackViewAlpha(currentView: dragView)
                isViewSnapped = false
            }
        }
    }
    
    func changeStackViewAlpha(currentView: UIView) {
        
        if isViewSnapped {
            for stackView in stackViews {
                if stackView == currentView {
                    UIView.animate(withDuration: 0.5, animations: {
                        stackView.textView.alpha = 0
                    })
                }
                stackView.alpha = 1
            }
        } else {
            for stackView in stackViews {
                if stackView != currentView {
                    stackView.alpha = 0
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        stackView.textView.alpha = 1
                    })
                }
                
            }
        }
    }

}


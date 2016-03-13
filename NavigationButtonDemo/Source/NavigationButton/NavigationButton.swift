//
//  NavigationButton.swift
//  NavigationButtonDemo
//
//  Created by Alex on 13/03/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

public class NavigationButton: UIButton {
    
    private var bgView: NavigationButtonBackground?
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configuration()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
    }
}

// MARK: configuration

extension NavigationButton {
    
    private func configuration() {
        
        guard let backgroundColor = self.backgroundColor else {
            fatalError("set background color")
        }
        
        addTarget(self, action: "onTap:", forControlEvents: .TouchUpInside)
        
//        bgView = createBackground(backgroundColor)
        bgView = createBackground(.greenColor())
//        createConstraintsToView(bgView, superView: superview, height: 150)
    }
}

// MARK: actions 

extension NavigationButton {
    
    func onTap(sender: UIButton) {
        showBackgroundView()
    }
}

// MARK: helpers

extension NavigationButton {
    
    private func createBackground(color: UIColor) -> NavigationButtonBackground {
        return Init(NavigationButtonBackground(frame: CGRect.zero)){
            $0.backgroundColor = color
            $0.translatesAutoresizingMaskIntoConstraints = false;
        }
    }
    
    private func createConstraintsToView(aView: UIView?, superView: UIView?, height: CGFloat) {
        guard let superView = superView else {
            fatalError("super view can't be empty")
        }
        guard let aView = aView else {
            fatalError("need create bgView")
        }
        
        superView.insertSubview(aView, belowSubview: self)
        
        // add constraints
        aView.addConstraint(NSLayoutConstraint(item: aView, attribute: .Height, relatedBy: .Equal, toItem: nil,
            attribute: .Height, multiplier: 1, constant: height))
        
        superView.addConstraints([
            NSLayoutConstraint(item: aView, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom,
                multiplier: 1, constant: 0),
            NSLayoutConstraint(item: aView, attribute: .Leading, relatedBy: .Equal, toItem: superview, attribute: .Leading,
                multiplier: 1, constant: 0),
            NSLayoutConstraint(item: aView, attribute: .Trailing, relatedBy: .Equal, toItem: superview, attribute: .Trailing,
                multiplier: 1, constant: 0)
            ])
        
        superview?.setNeedsLayout()
    }
    
    private func showBackgroundView() {
        
        if bgView?.superview == nil {
            createConstraintsToView(bgView, superView: superview, height: 200)
        } else {
            bgView?.removeFromSuperview()
        }

    }
}
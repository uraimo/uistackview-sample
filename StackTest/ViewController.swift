//
//  ViewController.swift
//  StackTest
//
//  Created by Umberto Raimondi on 11/09/15.
//  Copyright © 2015 Umberto Raimondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView:UIStackView!
    var nestedStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints=false
        self.view.addSubview(stackView)
        // Main UIStackView contraints, nearly fills its parent view
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[stackView]-30-|",
            options: NSLayoutFormatOptions.AlignAllLeading,metrics: nil, views: ["stackView":stackView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[stackView]-10-|",
            options: NSLayoutFormatOptions.AlignAllLeading,metrics: nil, views: ["stackView":stackView]))
        
        
        stackView.axis = .Vertical
        stackView.alignment = .Fill
        stackView.spacing = 25
        stackView.distribution = .FillEqually
        
        var lbl = UILabel()
        lbl.text="Label 1"
        lbl.backgroundColor = UIColor.redColor()
        lbl.setContentHuggingPriority(1000, forAxis: UILayoutConstraintAxis.Vertical)
        
        stackView.addArrangedSubview(lbl)
        
        lbl = UILabel()
        lbl.text="Label 2"
        lbl.backgroundColor = UIColor.greenColor()
        lbl.setContentHuggingPriority(900, forAxis: UILayoutConstraintAxis.Vertical)
        stackView.addArrangedSubview(lbl)
        
        nestedStackView.axis = .Horizontal
        nestedStackView.alignment = .Fill
        nestedStackView.spacing = 25
        nestedStackView.distribution = .FillEqually
        nestedStackView.addArrangedSubview(UIButton(type: .InfoDark))
        nestedStackView.addArrangedSubview(UIButton(type: .InfoLight))
        nestedStackView.addArrangedSubview(UIButton(type: .ContactAdd))
        stackView.addArrangedSubview(nestedStackView)
        
        let btn=UIButton(type: .System)
        btn.setContentHuggingPriority(1000, forAxis: UILayoutConstraintAxis.Vertical)
        btn.setTitle("Press Me", forState: .Normal)
        btn.addTarget(self, action: "pressedme:", forControlEvents: UIControlEvents.TouchUpInside)
        stackView.addArrangedSubview(btn)
        
    }
    
    func pressedme(sender: UIButton!){
        UIView.animateWithDuration(0.5) {
            self.nestedStackView.hidden = !self.nestedStackView.hidden
        }
        //stackView.removeArrangedSubview(lastLabel)
        //lastLabel.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


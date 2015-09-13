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
    var lastLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints=false
        self.view.addSubview(stackView)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[stackView]-30-|",
            options: NSLayoutFormatOptions.AlignAllLeading,metrics: nil, views: ["stackView":stackView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[stackView]-10-|",
            options: NSLayoutFormatOptions.AlignAllLeading,metrics: nil, views: ["stackView":stackView]))
        
        
        stackView.axis = .Vertical
        stackView.alignment = .Fill
        stackView.spacing = 25
        stackView.distribution = .FillProportionally
        
        var lbl = UILabel()
        lbl.text="Label 1"
        lbl.backgroundColor = UIColor.redColor()
        stackView.addArrangedSubview(lbl)
        
        lbl = UILabel()
        lbl.text="Label 2"
        lbl.backgroundColor = UIColor.greenColor()
        stackView.addArrangedSubview(lbl)
        
        lastLabel.text="Label 3"
        lastLabel.backgroundColor = UIColor.blueColor()
        stackView.addArrangedSubview(lastLabel)
        
        let btn=UIButton(type: .System)
        btn.setTitle("Press Me", forState: .Normal)
        btn.addTarget(self, action: "pressedme:", forControlEvents: UIControlEvents.TouchUpInside)
        stackView.addArrangedSubview(btn)
        
    }
    
    func pressedme(sender: UIButton!){
        UIView.animateWithDuration(0.5) {
            self.lastLabel.hidden = !self.lastLabel.hidden
        }
        //stackView.removeArrangedSubview(lastLabel)
        //lastLabel.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


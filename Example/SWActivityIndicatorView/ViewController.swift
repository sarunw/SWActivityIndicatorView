//
//  ViewController.swift
//  SWActivityIndicatorView
//
//  Created by Sarun Wongpatcharapakorn on 10/19/2015.
//  Copyright (c) 2015 Sarun Wongpatcharapakorn. All rights reserved.
//

import UIKit
import SWActivityIndicatorView

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicatorView: SWActivityIndicatorView!

    @IBAction func didTapStop(sender: AnyObject) {
        self.activityIndicatorView.stopAnimating()
    }
    
    @IBAction func didTapChangeLineWidth(sender: AnyObject) {
        let lineWidth = self.activityIndicatorView.lineWidth
        if lineWidth == 2 {
            self.activityIndicatorView.lineWidth = 4
        } else {
            self.activityIndicatorView.lineWidth = 2
        }
    }
    
    @IBAction func didTapChangeColor(sender: AnyObject) {
        let color = self.activityIndicatorView.color
        if color == UIColor.lightGrayColor() {
            self.activityIndicatorView.color = UIColor.redColor()
        } else {
            self.activityIndicatorView.color = UIColor.lightGrayColor()
        }
    }
    
    @IBAction func didTapStart(sender: AnyObject) {
        self.activityIndicatorView.startAnimating()
    }
}


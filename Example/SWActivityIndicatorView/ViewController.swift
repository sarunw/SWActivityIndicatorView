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

    @IBAction func didTapStop(_ sender: AnyObject) {
        self.activityIndicatorView.stopAnimating()
    }
    
    @IBAction func didTapChangeLineWidth(_ sender: AnyObject) {
        let lineWidth = self.activityIndicatorView.lineWidth
        if lineWidth == 2 {
            self.activityIndicatorView.lineWidth = 4
        } else {
            self.activityIndicatorView.lineWidth = 2
        }
    }
    
    @IBAction func didTapChangeColor(_ sender: AnyObject) {
        let color = self.activityIndicatorView.color
        if color == UIColor.lightGray {
            self.activityIndicatorView.color = UIColor.red
        } else {
            self.activityIndicatorView.color = UIColor.lightGray
        }
    }
    
    @IBAction func didTapStart(_ sender: AnyObject) {
        self.activityIndicatorView.startAnimating()
    }
}


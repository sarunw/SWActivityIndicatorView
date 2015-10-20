//
//  ManualViewController.swift
//  SWActivityIndicatorView Example
//
//  Created by Sarun Wongpatcharapakorn on 10/20/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import SWActivityIndicatorView

class ManualViewController: UIViewController {
    var activityIndicatorView: SWActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicatorView = SWActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.view.addSubview(self.activityIndicatorView)
        self.activityIndicatorView.center = self.view.center
        self.activityIndicatorView.startAnimating()
    }
}

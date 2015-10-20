//
//  SWActivityIndicatorView.swift
//  Pods
//
//  Created by Sarun Wongpatcharapakorn on 10/19/15.
//
//

import UIKit

private let SWSpinningAnimationKey = "Rotation"

@IBDesignable public class SWActivityIndicatorView: UIView {
    @IBInspectable public var lineWidth: CGFloat = 2 {
        didSet {
            self.circlePathLayer.lineWidth = lineWidth
        }
    }
    private(set) public var isAnimating = false
    @IBInspectable public var autoStartAnimating: Bool = false {
        didSet {
            if autoStartAnimating && self.superview != nil {
               self.animate(true)
            }
        }
    }
    @IBInspectable public var hidesWhenStopped: Bool = false {
        didSet {
            
        }
    }
    @IBInspectable public var color: UIColor = UIColor.lightGrayColor() {
        didSet {
            self.circlePathLayer.strokeColor = color.CGColor
        }
    }
    
    private var circlePathLayer = CAShapeLayer()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.circlePathLayer.frame = bounds
        self.circlePathLayer.path = self.circlePath().CGPath
    }
    
    override public func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        if newSuperview != nil {
            if self.autoStartAnimating {
                self.animate(true)
            }
        } else {
            self.animate(false)
        }
    }
    
    
    public func startAnimating() {
        self.animate(true)
    }
    
    public func stopAnimating() {
        self.animate(false)
    }
    
    private func animate(animated: Bool) {
        if animated {
            self.hidden = false
            
            if self.isAnimating == false {
                // create or resume
                if self.circlePathLayer.animationForKey(SWSpinningAnimationKey) == nil {
                    self.createAnimationLayer(self.circlePathLayer)
                } else {
                    self.resumeLayer(self.circlePathLayer)
                }
            }
            
            self.isAnimating = true
        } else {
            self.isAnimating = false
            self.pauseLayer(self.circlePathLayer)
            if self.hidesWhenStopped {
                self.hidden = true
            }
        }
    }
    
    private func pauseLayer(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    private func resumeLayer(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePaused = layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        layer.beginTime = timeSincePaused
    }
    
    private func createAnimationLayer(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = NSNumber(float: 0)
        animation.toValue = NSNumber(double: 2 * M_PI)
        animation.duration = 0.9;
        animation.removedOnCompletion = false // prevent from getting remove when app enter background or view disappear
        animation.repeatCount = Float.infinity
        layer.addAnimation(animation, forKey: SWSpinningAnimationKey)
    }
    
    private func circleFrame() -> CGRect {
        // Align center
        let diameter = min(self.circlePathLayer.bounds.size.width, self.circlePathLayer.bounds.size.height)
        var circleFrame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        circleFrame.origin.x = CGRectGetMidX(circlePathLayer.bounds) - CGRectGetMidX(circleFrame)
        circleFrame.origin.y = CGRectGetMidY(circlePathLayer.bounds) - CGRectGetMidY(circleFrame)
        
        // offset lineWidth
        let inset = self.circlePathLayer.lineWidth / 2
        circleFrame = CGRectInset(circleFrame, inset, inset)
        
        return circleFrame

    }
    
    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: self.circleFrame())
    }
    
    private func configure() {
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = self.lineWidth
        circlePathLayer.fillColor = UIColor.clearColor().CGColor
        circlePathLayer.strokeColor = self.color.CGColor
        circlePathLayer.strokeEnd = 0.9
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor.whiteColor()        
    }
    
    
}
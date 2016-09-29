//
//  SWActivityIndicatorView.swift
//  Pods
//
//  Created by Sarun Wongpatcharapakorn on 10/19/15.
//
//

import UIKit

private let SWSpinningAnimationKey = "Rotation"

@IBDesignable open class SWActivityIndicatorView: UIView {
    @IBInspectable open var lineWidth: CGFloat = 2 {
        didSet {
            self.circlePathLayer.lineWidth = lineWidth
        }
    }
    fileprivate(set) open var isAnimating = false
    @IBInspectable open var autoStartAnimating: Bool = false {
        didSet {
            if autoStartAnimating && self.superview != nil {
               self.animate(true)
            }
        }
    }
    @IBInspectable open var hidesWhenStopped: Bool = false {
        didSet {
            
        }
    }
    @IBInspectable open var color: UIColor = UIColor.lightGray {
        didSet {
            self.circlePathLayer.strokeColor = color.cgColor
        }
    }
    
    fileprivate var circlePathLayer = CAShapeLayer()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.circlePathLayer.frame = bounds
        self.circlePathLayer.path = self.circlePath().cgPath
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview != nil {
            if self.autoStartAnimating {
                self.animate(true)
            }
        } else {
            self.animate(false)
        }
    }
    
    
    open func startAnimating() {
        self.animate(true)
    }
    
    open func stopAnimating() {
        self.animate(false)
    }
    
    fileprivate func animate(_ animated: Bool) {
        if animated {
            self.isHidden = false
            
            if self.isAnimating == false {
                // create or resume
                if self.circlePathLayer.animation(forKey: SWSpinningAnimationKey) == nil {
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
                self.isHidden = true
            }
        }
    }
    
    fileprivate func pauseLayer(_ layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    fileprivate func resumeLayer(_ layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePaused = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePaused
    }
    
    fileprivate func createAnimationLayer(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = NSNumber(value: 0 as Float)
        animation.toValue = NSNumber(value: 2 * M_PI as Double)
        animation.duration = 0.9;
        animation.isRemovedOnCompletion = false // prevent from getting remove when app enter background or view disappear
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: SWSpinningAnimationKey)
    }
    
    fileprivate func circleFrame() -> CGRect {
        // Align center
        let diameter = min(self.circlePathLayer.bounds.size.width, self.circlePathLayer.bounds.size.height)
        var circleFrame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        circleFrame.origin.x = circlePathLayer.bounds.midX - circleFrame.midX
        circleFrame.origin.y = circlePathLayer.bounds.midY - circleFrame.midY
        
        // offset lineWidth
        let inset = self.circlePathLayer.lineWidth / 2
        circleFrame = circleFrame.insetBy(dx: inset, dy: inset)
        
        return circleFrame

    }
    
    fileprivate func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: self.circleFrame())
    }
    
    fileprivate func configure() {
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = self.lineWidth
        circlePathLayer.fillColor = UIColor.clear.cgColor
        circlePathLayer.strokeColor = self.color.cgColor
        circlePathLayer.strokeEnd = 0.9
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor.white        
    }
    
    
}

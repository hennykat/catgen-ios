import Foundation
import UIKit

public class CatView: UIView {
    
    var radius: CGFloat = 0
    var centre = CGPoint(x: 0, y: 0)
    
    // MARK: UIView
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        radius = CatUtil.findRadius(rect: frame)
        centre = CatUtil.findCentre(rect: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func generate() {
        
        let catLayer = CAShapeLayer()
        
        let π = CGFloat.pi
        let topStartAngle: CGFloat = 4 * π / 3
        let topEndAngle: CGFloat = 5 * π / 3
        // 4pi/3 to 5pi/3
        let path = UIBezierPath(arcCenter: centre, radius: radius, startAngle: topStartAngle, endAngle: topEndAngle, clockwise: true)
        // 11pi/6 to 19pi/6
        let bottomStartAngle: CGFloat = 11 * π / 6
        let bottomEndAngle: CGFloat = 19 * π / 6
        path.addArc(withCenter: centre, radius: radius, startAngle: bottomStartAngle, endAngle: bottomEndAngle, clockwise: true)
        
        catLayer.position = center
        catLayer.path = path.cgPath
        catLayer.lineWidth = 2.0
        catLayer.strokeColor = UIColor.black.cgColor
        catLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(catLayer)
        
        // animate drawing
        addAnimation(layer: catLayer)
    }
    
    private func addAnimation(layer: CAShapeLayer) {
        
        layer.strokeStart = 0.0
        // don't draw yet
        layer.strokeEnd = 0.0
        
        // animate from 0 to 1
        let drawAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.fromValue = 0.0
        drawAnimation.toValue = 1.0
        drawAnimation.duration = 1.6
        drawAnimation.fillMode = kCAFillModeForwards
        drawAnimation.isRemovedOnCompletion = false
        layer.add(drawAnimation, forKey: nil)
    }
}

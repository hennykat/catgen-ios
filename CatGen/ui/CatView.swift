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
        
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = 2 * CGFloat.pi
        
        let path = UIBezierPath(arcCenter: centre, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
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

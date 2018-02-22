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
        
        let π = CGFloat.pi
        let innerRadius = radius * 2 / 3
        
        let topStartAngle: CGFloat = 4 * π / 3
        let topEndAngle: CGFloat = 5 * π / 3
        // head between ears
        let path = UIBezierPath(arcCenter: centre, radius: innerRadius, startAngle: topStartAngle, endAngle: topEndAngle, clockwise: true)
        // right ear
        let rightEarAngle = 7 * π / 4
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: radius, angle: rightEarAngle))
        // rest of hear
        let bottomStartAngle: CGFloat = 23 * π / 12
        let bottomEndAngle: CGFloat = 13 * π / 12
        path.addArc(withCenter: centre, radius: innerRadius, startAngle: bottomStartAngle, endAngle: bottomEndAngle, clockwise: true)
        // left ear
        let leftEarAngle = 13 * π / 4
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: radius, angle: leftEarAngle))
        // finish
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: innerRadius, angle: topStartAngle))
        
        let catLayer = CAShapeLayer()
        catLayer.path = path.cgPath
        catLayer.lineWidth = 4.0
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

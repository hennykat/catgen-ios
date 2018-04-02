import Foundation
import UIKit

public class CatView: UIView {
    
    var radius: CGFloat = 0
    var centre = CGPoint(x: 0, y: 0)
    var strokeColour = UIColor.black.cgColor
    var fillColour = UIColor.clear.cgColor
    var lineWidth: CGFloat = 4.0
    
    // MARK: UIView
    
    public init(frame: CGRect, strokeColour: CGColor, fillColour: CGColor = UIColor.clear.cgColor, lineWidth: CGFloat = 4.0) {
        super.init(frame: frame)
        
        self.radius = CatUtil.findRadius(rect: frame)
        self.centre = CatUtil.findCentre(rect: frame)
        self.strokeColour = strokeColour
        self.fillColour = fillColour
        self.lineWidth = lineWidth
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func generate(duration: CFTimeInterval = 1.6) {
        
        let π = CGFloat.pi
        let innerRadius = radius * 2 / 3
        
        let topStartAngle: CGFloat = 4 * π / 3
        let topEndAngle: CGFloat = 5 * π / 3
        // head between ears
        let path = UIBezierPath(arcCenter: centre, radius: innerRadius, startAngle: topStartAngle, endAngle: topEndAngle, clockwise: true)
        // right ear
        let rightEarAngle = 7 * π / 4
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: radius, angle: rightEarAngle))
        // rest of head
        let bottomStartAngle: CGFloat = 23 * π / 12
        let bottomEndAngle: CGFloat = 13 * π / 12
        path.addArc(withCenter: centre, radius: innerRadius, startAngle: bottomStartAngle, endAngle: bottomEndAngle, clockwise: true)
        // left ear
        let leftEarAngle = 13 * π / 4
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: radius, angle: leftEarAngle))
        path.addLine(to: CatUtil.calcEarPoint(x: centre.x, y: centre.y, radius: innerRadius, angle: topStartAngle))
        // complete line
        let midAngle: CGFloat = 3 * π / 2
        path.addArc(withCenter: centre, radius: innerRadius, startAngle: topStartAngle, endAngle: midAngle, clockwise: true)
        
        let catLayer = CAShapeLayer()
        catLayer.path = path.cgPath
        catLayer.lineWidth = lineWidth
        catLayer.strokeColor = strokeColour
        catLayer.fillColor = fillColour
        
        self.layer.addSublayer(catLayer)

        // animate drawing
        addAnimation(layer: catLayer, duration: duration)
    }

    private func addAnimation(layer: CAShapeLayer, duration: CFTimeInterval) {

        layer.strokeStart = 0.0
        // don't draw yet
        layer.strokeEnd = 0.0

        // animate from 0 to 1
        let drawAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.fromValue = 0.0
        drawAnimation.toValue = 1.0
        drawAnimation.duration = duration
        drawAnimation.fillMode = kCAFillModeForwards
        drawAnimation.isRemovedOnCompletion = false
        layer.add(drawAnimation, forKey: nil)
    }
}

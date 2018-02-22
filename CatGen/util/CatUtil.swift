import Foundation

class CatUtil {
    
    static func findCentre(rect: CGRect) -> CGPoint {
        
        // centre in boundary
        let x = rect.width / 2
        let y = rect.height / 2
        
        // square boundary
        return CGPoint(x: x, y: y)
    }
    
    static func findRadius(rect: CGRect) -> CGFloat {
        
        // find smallest side centre
        let minSide = min(rect.width, rect.height)
        return minSide / 2
    }
    
    static func calcEarPoint(x: CGFloat, y: CGFloat, radius: CGFloat, angle: CGFloat) -> CGPoint {
        
        let earX = x + radius * cos(angle)
        let earY = y + radius * sin(angle)
        
        return CGPoint(x: earX, y: earY)
    }
}

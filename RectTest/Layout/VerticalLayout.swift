import Foundation
import UIKit

class VerticalLayout: UIView {
    var yOffsets: [CGFloat] = []
    
    init(width: CGFloat, height: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var height: CGFloat = 0

        for i in 0..<subviews.count {
            let view = subviews[i] as UIView
            view.layoutSubviews()
            height += yOffsets[i]
            view.frame.origin.y = height
        }
    }
    
    override func addSubview(_ view: UIView) {
        yOffsets.append(view.frame.origin.y)
        super.addSubview(view)
    }
    
    func removeAll() {
        for view in subviews {
            view.removeFromSuperview()
        }
        yOffsets.removeAll(keepingCapacity: false)
        
    }
}

//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Steve Handy on 2024.05.05.
//

import CoreGraphics

struct HexagonParameters {
    struct Segment { // each side starts where previous ends
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint // controls shape of curve
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line: <#T##CGPoint#>(x: 0.60, y: 0.05),
            curve: <#T##CGPoint#>(x: 0.40, y: 0.05),
            control: <#T##CGPoint#>(x: 0.50, y: 0.00)
        ),
        Segment(
            line: <#T##CGPoint#>(x: 0.05, y: 0.20 + adjustment),
            curve: <#T##CGPoint#>(x: 0.00, y: 0.30 + adjustment),
            control: <#T##CGPoint#>(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line: <#T##CGPoint#>(x: 0.00, y: 0.70 - adjustment),
            curve: <#T##CGPoint#>(x: 0.05, y: 0.80 - adjustment),
            control: <#T##CGPoint#>(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: <#T##CGPoint#>(x: 0.40, y: 0.95),
            curve: <#T##CGPoint#>(x: 0.60, y: 0.95),
            control: <#T##CGPoint#>(x: 0.50, y: 1.00)
        ),
        Segment(
            line: <#T##CGPoint#>(x: 0.95, y: 0.80 - adjustment),
            curve: <#T##CGPoint#>(x: 1.00, y: 0.70 - adjustment),
            control: <#T##CGPoint#>(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line: <#T##CGPoint#>(x: 1.00, y: 0.30 + adjustment),
            curve: <#T##CGPoint#>(x: 0.95, y: 0.20 + adjustment),
            control: <#T##CGPoint#>(x: 1.00, 0.25 + adjustment)
        )
    ]
}

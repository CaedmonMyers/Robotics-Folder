//
// Robotics Folder
// ArrowShape.swift
//
// Created on 18/12/24
//
// Copyright ©2024 DoorHinge Apps.
//


import SwiftUI

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.49714*width, y: 0.99526*height))
        path.addCurve(to: CGPoint(x: 0.50286*width, y: 0.99526*height), control1: CGPoint(x: 0.49903*width, y: 0.99801*height), control2: CGPoint(x: 0.50097*width, y: 0.99801*height))
        path.addLine(to: CGPoint(x: 0.98463*width, y: 0.29547*height))
        path.addCurve(to: CGPoint(x: 0.98177*width, y: 0.01976*height), control1: CGPoint(x: 1.00471*width, y: 0.26631*height), control2: CGPoint(x: 1.00216*width, y: 0.01976*height))
        path.addLine(to: CGPoint(x: 0.01823*width, y: 0.01976*height))
        path.addCurve(to: CGPoint(x: 0.01537*width, y: 0.29547*height), control1: CGPoint(x: -0.00216*width, y: 0.01976*height), control2: CGPoint(x: -0.00471*width, y: 0.26631*height))
        path.addLine(to: CGPoint(x: 0.49714*width, y: 0.99526*height))
        path.closeSubpath()
        return path
    }
}

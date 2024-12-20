//
// Robotics Folder
// Title Page.swift
//
// Created on 18/12/24
//
// Copyright ©2024 DoorHinge Apps.
//


import SwiftUI


struct TitlePage: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "FFFFFF"), Color(hex: "FF823C").opacity(0.5)], startPoint: .top, endPoint: .bottom)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Text("1209")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "FF823C"), Color(hex: "F940A4")], startPoint: .leading, endPoint: .trailing))
                        .shadow(color: .white, radius: 1, x: 0, y: 0)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Text("RoboHornets")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [Color(hex: "FF823C"), Color(hex: "F940A4")], startPoint: .leading, endPoint: .trailing))
                    
                    Spacer()
                }
                
                ArrowShape()
                    .frame(width: 200, height: 30)
                    .foregroundStyle(LinearGradient(colors: [Color(hex: "FF823C"), Color(hex: "F940A4")], startPoint: .leading, endPoint: .trailing))
            }
        }.ignoresSafeArea()
    }
}

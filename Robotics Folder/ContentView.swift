//
// Robotics Folder
// ContentView.swift
//
// Created on 18/12/24
//
// Copyright ©2024 DoorHinge Apps.
//


import SwiftUI

struct ContentView: View {
    @State var scrollPosition = 0.0
    @State var currentPage = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ScrollViewReader { proxy in
                    ZStack {
                        ScrollView {
                            VStack(spacing: 0) {
                                TitlePage()
                                    .frame(height: geo.size.height)
                                    .id(0)
                                
                                Demographics1()
                                    .frame(height: geo.size.height)
                                    .id(1)
                                
                                Demographics2()
                                    .frame(height: geo.size.height)
                                    .id(2)
                                
                                Demographics3()
                                    .frame(height: geo.size.height)
                                    .id(3)
                                
                                Demographics3()
                                    .frame(height: geo.size.height)
                                    .id(4)
                            }.background(GeometryReader {
                                Color.clear.preference(key: ViewOffsetKey.self,
                                    value: -$0.frame(in: .named("scroll")).origin.y)
                            })
                            .onPreferenceChange(ViewOffsetKey.self) {
                                print("offset >> \($0)")
                                scrollPosition = $0
                                
                                currentPage = Int(scrollPosition/geo.size.height)
                            }
                        }.scrollTargetBehavior(.paging)
                        
                        //if Range(Int(geo.size.height*0.5)...Int(geo.size.height*2.5)).contains(Int(scrollPosition)) {
                        if Range(Int(geo.size.height*0.01)...Int(geo.size.height*3.99)).contains(Int(scrollPosition)) {
                            DemographicsChart(scrollPosition: $scrollPosition, currentPage: $currentPage, geo: geo)
                                .opacity(scrollPosition < geo.size.height*2 ? min(geo.size.height, scrollPosition)/geo.size.height : ((geo.size.height*4)-scrollPosition)/(geo.size.height))
                                //.animation(.default)
                        }
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                                Spacer()
                                
                                // Debugging for scroll position and current page
//                                Text(geo.size.height.description)
//                                
//                                Text(scrollPosition.description)
//                                
//                                Text("\(Int(scrollPosition/geo.size.height))")
                                
                                
                                Button {
                                    withAnimation {
                                        proxy.scrollTo(0)
                                    }
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(.regularMaterial)
                                            .frame(width: 50)
                                        
                                        Image(systemName: "arrowshape.up.fill")
                                            .font(.system(.headline, design: .rounded, weight: .bold))
                                            .foregroundStyle(Color(hex: "4C4C4C"))
                                    }
                                }
                                
                                Button {
                                    withAnimation {
                                        proxy.scrollTo(currentPage + 1)
                                    }
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(.regularMaterial)
                                            .frame(width: 50)
                                        
                                        Image(systemName: "arrowshape.down.fill")
                                            .font(.system(.headline, design: .rounded, weight: .bold))
                                            .foregroundStyle(Color(hex: "4C4C4C"))
                                    }
                                }

                            }.padding(30)
                        }
                    }
                }
            }
        }.ignoresSafeArea()
    }
}


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}


#Preview {
    ContentView()
}

//
// Robotics Folder
// Demographics.swift
//
// Created on 18/12/24
//
// Copyright ©2024 DoorHinge Apps.
//


import SwiftUI
import Charts

struct DemographicsCount: Identifiable {
    let id = UUID()
    var category: String
    var count: Int
    var color: Color
}

struct DemographicsChart: View {
    @Binding var scrollPosition: Double
    @Binding var currentPage: Int

    let allCategories: [[DemographicsCount]] = [
        [
            .init(category: "Male", count: 11, color: Color(hex: "709AFF")),
            .init(category: "Female", count: 8, color: Color(hex: "F940A4")),
            .init(category: "Other", count: 7, color: Color(hex: "C450FF"))
        ],
        [
            .init(category: "Freshmen", count: 11, color: Color(hex: "709AFF")),
            .init(category: "Sophomore", count: 8, color: Color(hex: "F940A4")),
            .init(category: "Junior", count: 7, color: Color(hex: "C450FF")),
            .init(category: "Senior", count: 10, color: Color(hex: "FF5050"))
        ],
        [
            .init(category: "Freshmen", count: 11, color: Color(hex: "709AFF")),
            .init(category: "Sophomore", count: 8, color: Color(hex: "F940A4")),
            .init(category: "Junior", count: 7, color: Color(hex: "C450FF")),
            .init(category: "Senior", count: 10, color: Color(hex: "FF5050"))
        ]
    ]

    @State private var animatedData: [DemographicsCount] = []
    
    var geo: GeometryProxy

    private var totalCount: Int {
        animatedData.reduce(0) { $0 + $1.count }
    }

    init(scrollPosition: Binding<Double>, currentPage: Binding<Int>, geo: GeometryProxy) {
        self._scrollPosition = scrollPosition
        self._currentPage = currentPage
        self.geo = geo
    }

    var body: some View {
        VStack {
            Chart(animatedData) { item in
                SectorMark(
                    angle: .value("Count", item.count),
                    innerRadius: .ratio(0.6),
                    angularInset: 2
                )
                .cornerRadius(5)
                .foregroundStyle(item.color)
            }
            .scaledToFit()
            .frame(maxHeight: 400)
            .chartLegend(.hidden)
            .padding(20)
            
            HStack {
                ForEach(animatedData) { item in
                    HStack {
                        Circle()
                            .fill(item.color)
                            .frame(width: 20, height: 20)
                        Text(item.category)
                            .font(.headline)
                            .foregroundStyle(Color.white)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            updateData(for: currentPage)
        }
        .onChange(of: currentPage) { newValue in
            updateData(for: newValue)
        }
    }

    private func updateData(for page: Int) {
        guard page >= 0 && page < allCategories.count else {
            animatedData = []
            return
        }
        withAnimation(.easeOut(duration: 0.5)) {
            animatedData = allCategories[page]
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}






struct Demographics1: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [Color(hex: "FF823C").opacity(0.5), Color(hex: "FF823C")], startPoint: .top, endPoint: .bottom)
            }.ignoresSafeArea()
        }
    }
}

struct Demographics2: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [Color(hex: "FF823C"), Color(hex: "F940A4")], startPoint: .top, endPoint: .bottom)
            }.ignoresSafeArea()
        }
    }
}

struct Demographics3: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [Color(hex: "F940A4"), Color(hex: "405DF9")], startPoint: .top, endPoint: .bottom)
            }.ignoresSafeArea()
        }
    }
}

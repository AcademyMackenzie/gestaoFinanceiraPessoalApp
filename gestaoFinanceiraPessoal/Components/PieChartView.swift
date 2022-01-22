//
//  PieChartView.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 19/01/22.
//

import SwiftUI

struct PieChartView: View {
    public let values: [Double]
    public var colors: [Color]
    
    var slice: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees:  endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<self.values.count) { i  in PieSliceView(pieSliceData: self.slice[i])}
            }
            .frame(width: geometry.size.width, height: geometry.size.width)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(values: [120,1230,484], colors: [Color("BlueColor"), Color("RedColor"), Color("GreenColor")])
    }
}

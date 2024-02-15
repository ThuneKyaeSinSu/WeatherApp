//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Thune Kyae Sin Su on 14/02/2024.
//

import SwiftUI

struct WeatherButton: View{
    @Binding var isNight: Bool
    
    var body: some View{
        Text("Change Day time")
            .frame(width: 280, height: 50)
            .background(.white)
            .foregroundStyle(isNight ? .gray : .blue)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

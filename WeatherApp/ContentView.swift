//
//  ContentView.swift
//  WeatherApp
//
//  Created by Thune Kyae Sin Su on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityView(city: "Cupertino, CA")
                MainWeatherStatusView(image: "cloud.sun.fill", temp: 76)
                HStack (spacing: 20){
                    ExtractedView(day: "TUE",
                                  image: "cloud.sun.fill",
                                  temp: 74)
                    ExtractedView(day: "WED",
                                  image: "sun.max.fill",
                                  temp: 74)
                    ExtractedView(day: "THUR",
                                  image: "wind.snow",
                                  temp: 74)
                    ExtractedView(day: "FRI",
                                  image: "cloud.sun.fill",
                                  temp: 74)
                    ExtractedView(day: "SAT",
                                  image: "cloud.sun.fill",
                                  temp: 74)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(isNight: $isNight)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var day: String
    var image: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8){
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°").font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .white : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct CityView: View {
    var city: String
    var body: some View{
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var image: String
    var temp: Int
    
    var body: some View{
        VStack(spacing: 8){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°").foregroundStyle(.white).font(.system(size: 70, weight: .medium ))
        }.padding(.bottom, 50)
    }
}

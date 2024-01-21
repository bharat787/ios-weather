//
//  ContentView.swift
//  weather
//
//  Created by Bharat Gupta on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack {
            GradientBackgroundColorView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 12) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 70)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 86)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 73)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 83)
                    
                }
                    
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct GradientBackgroundColorView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[isNight ? .black: .blue, isNight ? .gray: Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}
struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 40, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

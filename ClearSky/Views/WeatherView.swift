//
//  WeatherView.swift
//  ClearSky
//
//  Created by Nikko Baez on 8/23/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherModel
    
    var body: some View {
        VStack {
            // CITY NAME AND DATE
            VStack(spacing: 10) {
                Text(weather.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Today, \(Date().formatted())")
                    .font(.headline)
            }
            .foregroundColor(Color.white)
            .padding()
            
            // GENERAL WEATHER AND TEMPERATURE
            HStack {
                VStack(spacing: 10) {
                    Image(systemName: "sun.max")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text(weather.weather[0].main)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Text("\(weather.main.temp, specifier: "%.0f")")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                +
                Text("°")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            }
            .padding()
            .padding(.horizontal)
            
            Spacer()
            
            VStack (spacing: 50) {
                HStack {
                    
                    // MINIMUM TEMPERATURE
                    WeatherRow(
                        weatherVariableIcon: "thermometer",
                        weatherVariableName: "Min Temp",
                        weatherVariable: weather.main.temp_min,
                        weatherVariableUnit: "°F"
                    )
                    
                    Spacer()
                    
                    // MAXIMUM TEMPERATURE
                    WeatherRow(
                        weatherVariableIcon: "thermometer",
                        weatherVariableName: "Max Temp",
                        weatherVariable: weather.main.temp_max,
                        weatherVariableUnit: "°F"
                    )
                }
                
                HStack {
                    // WIND SPEED
                    WeatherRow(
                        weatherVariableIcon: "wind",
                        weatherVariableName: "Wind",
                        weatherVariable: weather.wind.speed,
                        weatherVariableUnit: "m/s"
                    )
                    
                    Spacer()
                    
                    // HUMIDITY
                    WeatherRow(
                        weatherVariableIcon: "humidity",
                        weatherVariableName: "Humidity",
                        weatherVariable: weather.main.humidity,
                        weatherVariableUnit: "%"
                    )
                }
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.white)
        .background(
            Image("WeatherImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

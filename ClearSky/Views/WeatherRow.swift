//
//  WeatherRow.swift
//  ClearSky
//
//  Created by Nikko Baez on 8/23/23.
//

import SwiftUI

struct WeatherRow: View {
    let weatherVariableIcon: String
    let weatherVariableName: String
    let weatherVariable: Double
    let weatherVariableUnit: String
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(Color.teal.opacity(0.7))
                    .frame(width: 50, height: 50)
                Image(systemName: weatherVariableIcon)
                    .font(.title)
            }
            
            VStack(alignment: .leading){
                Text(weatherVariableName)
                Text("\(weatherVariable, specifier: "%.0f")")
                +
                Text(weatherVariableUnit)
            }
            .font(.headline)
        }
        .padding(.horizontal)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(
            weatherVariableIcon: "humidity",
            weatherVariableName: "Humidity",
            weatherVariable: 75.0, weatherVariableUnit: "%"
        )
    }
}

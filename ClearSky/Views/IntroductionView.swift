//
//  IntroductionView.swift
//  ClearSky
//
//  Created by Nikko Baez on 8/23/23.
//

import SwiftUI

struct IntroductionView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weatherViewModel.weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                    .task {
                        do {
                            try await weatherViewModel.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}

//
//  WeatherModel.swift
//  ClearSky
//
//  Created by Nikko Baez on 8/23/23.
//

import Foundation

struct WeatherModel: Decodable {
    var coord: Coordinates
    var weather: [Weather]
    var main: Main
    var name: String
    var wind: Wind
    
    struct Coordinates: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct Weather: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct Main: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct Wind: Decodable {
        var speed: Double
        var deg: Double
    }
}

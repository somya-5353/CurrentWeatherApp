//
//  WeatherImageHelper.swift
//  CurrentWeatherApp
//
//  Created by Somya on 15/07/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

class WeatherImageHelper {
    
    //func to get background image based on weather code
    static func getWeatherImage(weatherCode: Int) -> String {
        
        if weatherCode == 113 {
            return WeatherCode.sunny.rawValue
        }
        if weatherCode == 116 {
            return WeatherCode.partlyCloudy.rawValue
        }
        if weatherCode == 119 || weatherCode == 122 {
            return WeatherCode.cloudy.rawValue
        }
        if weatherCode == 143 || weatherCode == 248 || weatherCode == 260 {
            return WeatherCode.fog.rawValue
        }
        if weatherCode == 176 || weatherCode == 263 || weatherCode == 266 || weatherCode == 281 || weatherCode == 293 || weatherCode == 296 {
            return WeatherCode.drizzling.rawValue
        }
        if weatherCode == 179 || weatherCode == 182 || weatherCode == 185 || weatherCode == 200 || weatherCode == 230 || weatherCode == 227 || weatherCode == 284 {
            return WeatherCode.snowy.rawValue
        }
        if weatherCode == 299 || weatherCode == 302 || weatherCode == 305 || weatherCode == 308 {
            return WeatherCode.rainy.rawValue
        }
        return WeatherCode.unknown.rawValue
    }
}

//
//  CurrentWeatherModel.swift
//  CurrentWeatherApp
//
//  Created by Somya on 07/07/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

class CurrentWeatherModel {
    
    var temperature: Int?
    var humidity: Int?
    var precipiceProbability: Int?
    var description: String?
    var icon: String?
    
    /*"observation_time":"09:11 AM",
          "temperature":26,
          "weather_code":116,
          "weather_icons":[
    ],
          "weather_descriptions":[
    ],
          "wind_speed":13,
          "wind_degree":220,
          "wind_dir":"SW",
          "pressure":1015,
          "precip":0,
          "humidity":76,
          "cloudcover":50,
          "feelslike":28,
          "uv_index":1,
          "visibility":16,
          "is_day":"no"
     */
    
    struct weatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precip = "precip"
        static let description = "weather_descriptions"
        static let icon = "weather_icons"
    }
    
    init(weatherDictionary: [String:Any]) {
        
        if let temperatureDouble = weatherDictionary[weatherKeys.temperature] as? Double {
            temperature = Int(temperatureDouble)
        } else {
            temperature = nil
        }
        
        if let humidityDouble = weatherDictionary[weatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[weatherKeys.precip] as? Double {
            precipiceProbability = Int(precipDouble)
        } else {
            precipiceProbability = nil
        }
        
        description = weatherDictionary[weatherKeys.description] as? String
        icon = weatherDictionary[weatherKeys.icon] as? String
    }
}

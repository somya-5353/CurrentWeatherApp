//
//  CurrentWeatherData.swift
//  CurrentWeatherApp
//
//  Created by Somya on 09/07/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeatherData {
    
    /* sample URL: http://api.weatherstack.com/current?access_key=77bd12b133ab14fb1fc303b0fc1c9472&query=New%20York
     */
    
    
    
    func getWeatherData(location: String, completion: @escaping (CurrentWeatherModel?)->Void) {
        
        let urlString = "http://api.weatherstack.com/current?access_key=\(Constants.apiKey)&query=\(location)"
        let finalString =  urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //  print(finalString)
        if let url = URL(string: finalString!) {
            Alamofire.request(url).responseJSON(completionHandler: {
                response in
                print(response)
                if let jsonResponse = response.result.value as? [String:Any] {
                    if let weatherDictionary = jsonResponse["current"] as? [String:Any] {
                        let currentWeather = CurrentWeatherModel(weatherDictionary: weatherDictionary)
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                }
            }
            )
        } else {
            print("url cannot be created! ")
        }
        
    }
    
    
}

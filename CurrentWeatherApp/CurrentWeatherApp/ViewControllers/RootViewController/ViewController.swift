//
//  ViewController.swift
//  CurrentWeatherApp
//
//  Created by Somya on 07/07/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureCentreConstraint: NSLayoutConstraint!
    @IBOutlet weak var cityLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    var dataProvider: CurrentWeatherData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.celsiusLabel.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        self.cityLabelConstraint.constant = -300
        self.temperatureCentreConstraint.constant = self.temperatureCentreConstraint.constant - self.view.bounds.width
        fetchWeatherData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animateLabel()
    }
    
    //function to get weather data
    func fetchWeatherData() {
        dataProvider = CurrentWeatherData()
        let location = "Bengaluru"
        dataProvider.getWeatherData(location: location, completion: {(currentWeatherModel) in
            if let weather = currentWeatherModel {
                DispatchQueue.main.async {
                    if let temperature = weather.temperature {
                        self.temperatureLabel.text = "\(temperature)℃"
                        self.temperatureLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
                        if let code = weather.code {
                            let stringImage = WeatherImageHelper.getWeatherImage(weatherCode: code)
                            if stringImage == WeatherCode.snowy.rawValue || stringImage == WeatherCode.fog.rawValue || stringImage == WeatherCode.drizzling.rawValue {
                                self.cityLabel.textColor = UIColor.black
                                self.temperatureLabel.textColor = UIColor.black
                                self.celsiusLabel.textColor = UIColor.black
                            }
                            self.backgroundImage.image = UIImage(named: stringImage)
                        } else {
                            self.backgroundImage.image = UIImage(named: "default")
                        }
                        
                    } else {
                        self.temperatureLabel.text = "--"
                    }
                }
            }
            
        })
    }
    
    //func to animate the temperature label
    func animateLabel() {
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            self.temperatureCentreConstraint.constant = self.temperatureCentreConstraint.constant + self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.8, options: .curveEaseInOut, animations: {
            self.cityLabelConstraint.constant =  250
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1.0, options:.curveEaseInOut, animations: {
            self.celsiusLabel.transform = .identity
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}


//
//  weatherData.swift
//  Clima
//
//  Created by 현학 on 25/10/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct  WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}

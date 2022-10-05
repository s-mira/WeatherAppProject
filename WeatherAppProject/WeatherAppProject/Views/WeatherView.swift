//
//  WeatherView.swift
//  WeatherAppProject
//
//  Created by Miranda Stewart on 10/5/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 8) {
                            if weather.weather[0].main == "Mist" {
                                Image(systemName: "cloud.fog.fill")
                                    .font(.system(size: 50))
                                    .padding(.top)
                            } else {
                                if weather.weather[0].main == "Clouds" {
                                    Image(systemName: "cloud.fill")
                                        .font(.system(size: 50))
                                        .padding(.top)
                                } else {
                                    if weather.weather[0].main == "Rain" {
                                        Image(systemName: "cloud.rain.fill")
                                            .font(.system(size: 50))
                                            .padding(.top)
                                        } else {
                                            Image(systemName: "sun.max.fill")
                                                .font(.system(size: 50))
                                                .padding(.top)
                                    }
                                }
                            }
                            Text(weather.weather[0].main)
                        }
                        .padding(.leading)
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 180)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2018/12/10/16/22/city-3867295_1280.png")){image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 390)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Weather Now:")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.snowflake", name: "Low Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.sun", name: "High Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                            .padding(.trailing)
                            
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "mph"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                            .padding(.trailing)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.551, saturation: 0.442, brightness: 0.6))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.549, saturation: 0.443, brightness: 0.695))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

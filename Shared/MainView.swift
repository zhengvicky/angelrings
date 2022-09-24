//
//  MainView.swift
//  Angel Rings
//
//  Created by Vicky Zheng on 9/22/22.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let url = URL(string: "https://storage.googleapis.com/storage/v1/b/angelrings-tracking/o")

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("So failed: \(error)")
    }
    
    func sendPUT() {
        var request = URLRequest(url: url!)
        request.setValue("Bearer " + "ya29.a0Aa4xrXMqf9cV0wZTcXpOPO3UIb48GYq6kBNvdo9KUYjXat-ED8XCWszNEjX6DOo2ViSEr0jrOnXV8srN_aEijvmiM-RZLydV_XXHo9VnyEUCJacs-B2hc6m-MB3_OpXzgcSVuLaDgTr_C5rA_wSdvz5gnBKzaCgYKATASARISFQEjDvL9T2u330vo3PAS5clfErAGZQ0163", forHTTPHeaderField: "Authorization")
        
        // Serialize HTTP Body data as JSON
        let body = ["location": location]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a PUT request
        request.httpMethod = "PUT"
        request.httpBody = bodyData
        
        print(request.allHTTPHeaderFields!)
        
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print("HTTP POST request error: \(error)")
            } else if data != nil {
                print("HTTP POST response: \(response!.description)")
            } else {
                print("HTTP POST request error")
            }
        }
        
        task.resume()
    }
}

struct MainView: View {
    @EnvironmentObject var main: Main
    @StateObject var locationManager = LocationManager()
    
    let beige = Color(red: 0.9804, green: 0.9333, blue: 0.7725)
    var profile: RoundedRectangle { RoundedRectangle(cornerRadius: 10) }
    
    var body: some View {
        ZStack {
            beige.ignoresSafeArea()
            VStack {
                Text(main.getCaution())
                    .font(.system(size: 25))
                ZStack {
                    let buttonSize = 190.0;
                    let shadowSize = 220.0;
                    
                    let (innerCircle, OuterCircle) = main.getColor()
                    
                    OuterCircle
                        .clipShape(Circle())
                        .frame(width: shadowSize, height: shadowSize)
                    Button(main.getState()) {
                        main.activated.toggle()
                        locationManager.requestLocation()
                        locationManager.sendPUT()
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .frame(width: buttonSize, height: buttonSize)
                    .background(innerCircle)
                    .clipShape(Circle())
                }.padding([.top, .bottom], 30)
                Text(main.getCurrentInstructions())
                    .multilineTextAlignment(.center)
                if let location = locationManager.location {
                    Text("Your location: \(location.latitude), \(location.longitude)")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let main = Main()
    static var previews: some View {
        MainView().environmentObject(main)
    }
}

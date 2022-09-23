//
//  TripsView.swift
//  Angel Rings
//
//  Created by Vicky Zheng on 9/22/22.
//

import SwiftUI

struct Trip: Identifiable {
    let id = UUID()
    let date: String
    let time: String
    let address: String
}

struct TripsView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.9804, green: 0.9333, blue: 0.7725))
    }
    var history = [
        Trip(date: "Date", time:"Time", address:"View Trip"),
        Trip(date: "9/1/2022", time:"21:10", address:"401 Memorial Drive"),
        Trip(date: "8/25/2022", time: "3:30", address: "401 Memorial Drive"),
        Trip(date: "8/15/2022", time: "13:19", address: "Stevenson Ave"),
        Trip(date: "8/12/2022", time: "18:34", address: "Balboa Drive"),
        Trip(date: "8/11/2022", time: "1:21", address: "Balboa Drive"),
        Trip(date: "8/2/2022", time: "2:32", address: "Huntington Street")
    ]
    var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 25) }
    let beige = Color(red: 0.9804, green: 0.9333, blue: 0.7725)
    var body: some View {
        ZStack {
            VStack {
                ZStack(alignment: .leading) {
                    beige
                        .frame(width: 400, height: 200)
                        .clipShape(shape)
                        .ignoresSafeArea()
                    VStack{
                        Text("User History")
                            .font(.system(size: 35))
                            .padding([.leading], 20)
                        Text("Last checked in 3 hours ago")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .padding([.leading], 30)
                    }
                }
                List{
                    ForEach(history) { trip in
                        HStack {
                            Text(trip.date).frame(width: 85, alignment: .leading)
                            Text(trip.time).frame(width: 50, alignment: .leading)
                            Text(trip.address)
                        }
                    }
                }.frame(width: 430, height: 310, alignment: .topLeading)
                Button("View More") {}.foregroundColor(.black)
                Spacer()
            }
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}

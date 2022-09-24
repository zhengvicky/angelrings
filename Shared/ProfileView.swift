//
//  ProfileView.swift
//  Angel Rings
//
//  Created by Vicky Zheng on 9/22/22.
//

import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let picture: String
    let relationship: String
}

struct ProfileView: View {
    var contacts = [
        Contact(name: "Bob Duncan", picture: "Emergency Contact #1", relationship: "Boyfriend"),
        Contact(name: "Steph Leon", picture: "Emergency Contact #1", relationship: "Roommate"),
        Contact(name: "Julia Nelson", picture: "Emergency Contact #1", relationship: "Friend"),
        Contact(name: "Mia Hunt", picture: "Emergency Contact #1", relationship: "Friend"),
        Contact(name: "Dylan Smith", picture: "Emergency Contact #1", relationship: "Friend"),
    ]
    let beige = Color(red: 0.9804, green: 0.9333, blue: 0.7725)
    
    var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
    var profile: RoundedRectangle { RoundedRectangle(cornerRadius: 10) }
    
    @State private var activated = false
    
    var body: some View {
        ZStack(alignment: .top) {
            beige.ignoresSafeArea()
                .frame(height: 280, alignment: .top)
                .clipShape(shape)
            VStack {
                ZStack {
                    HStack {
                        VStack {
                            Image("Profile")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                            Button("edit") {}
                                .foregroundColor(.gray)
                        }
                        VStack {
                            Text("Vicky Zheng")
                                .font(.system(size: 30))
                            Text("Last checked in 3 hours ago")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }
                    }
                }.padding([.top], 75)
                // emergency contact
                ZStack {
                    VStack(alignment: .leading) {
                        Text("**Emergency Contacts**")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                        ForEach(contacts.indices) { i in
                            ZStack(alignment: .leading) {
                                Color
                                    .white
                                    .frame(width: 360, height: 70)
                                    .clipShape(shape)
                                    .overlay(
                                        shape.stroke(beige, lineWidth: 2)
                                    )
                                
                                HStack {
                                    Text("\(i+1)")
                                        .foregroundColor(Color(red: 0.9529, green: 0.7961, blue: 0.2706))
                                        .font(.system(size: 25))
                                        .padding([.leading], 10)
                                    Image(contacts[i].picture)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(profile)
                                        .padding([.leading], 10)
                                    VStack(alignment: .leading) {
                                        Text(contacts[i].name)
                                            .font(.system(size: 20))
                                        Text(contacts[i].relationship)
                                            .foregroundColor(.gray)
                                    }.padding([.leading], 5)
                                }
                            }
                        }
                    }
                }.padding([.top], 30) // emergency contact end
                Spacer()
                Button("Log Out") {}
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(beige)
                    .clipShape(shape)
                    .padding([.bottom], 40)
            }
        }.ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

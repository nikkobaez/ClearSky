//
//  WelcomeView.swift
//  ClearSky
//
//  Created by Nikko Baez on 8/23/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 25) {
                // LOGO
                HStack {
                    Image(systemName: "cloud.circle.fill")
                        .font(.largeTitle)
                    Text("ClearSky")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.bottom)
                .padding(.top, 25)
            
                // BUTTON
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .tint(Color.teal)
                .symbolVariant(.fill)
                .font(.title3)
                .fontWeight(.bold)
                .cornerRadius(5.0)
                
                Spacer()
            }
            .foregroundColor(Color.white)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("IntroductionImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            , alignment: .center
        )
    }
    
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(LocationManager())
    }
}

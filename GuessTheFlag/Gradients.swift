//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by tibo on 30/10/2021.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Gradients in SwiftUI")
                .foregroundColor(.secondary)
                .font(.title)
                .padding(50)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            Spacer()
            VStack {
                
                HStack{
                    //One-direction Gradient from top to bottom
                    LinearGradient(gradient: Gradient(colors: [.white, .black, .yellow]), startPoint: .top, endPoint: .bottom)
                    
                    // Let's use stops and another direction
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: .primary, location: 0.15),
                        .init(color: .secondary, location: 0.75), // SwifUI knows we're creating Gradient stops, so we can use .init(...) instead of 'Gradient.Stop'
                    ]), startPoint: .leading, endPoint: .bottom)
                }
                
                HStack{
                    // Radial direction gradient
                    RadialGradient(gradient: Gradient(colors: [.blue, .black, .mint]), center: .center, startRadius: 20, endRadius: 100)
                    
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                }
                
            }
            .frame(width: 400, height: 400, alignment: .center)
            
            Spacer()
        }
        
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}

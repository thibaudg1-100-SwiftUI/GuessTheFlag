//
//  Alerts.swift
//  GuessTheFlag
//
//  Created by tibo on 30/10/2021.
//

import SwiftUI

struct Alerts: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Are you sure?", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { } //any button inside an alert will automatically dismiss the alert – that closure is there to let us add any extra functionality beyond just dismissing the alert.
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("All your settings will be reset to defaults.")
        }
        /* That attaches the alert to the button, but honestly it doesn’t matter where the alert() modifier is used – all we’re doing is saying that an alert exists and is shown when showingAlert is true.
        */
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}

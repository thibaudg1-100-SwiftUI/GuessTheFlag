//
//  ButtonsImages.swift
//  GuessTheFlag
//
//  Created by tibo on 30/10/2021.
//

import SwiftUI

struct ButtonsImages: View {
    var body: some View {
        VStack(spacing:20) {
            
            // a Button with a label and an action passed as a trailing closure
            Button("Delete selection") {
                print("Now deleting…")
            }
            
            // another way to define the same button, using a function
            Button("Delete selection", action: executeDelete)
            
            // define a role: .destructive ; .cancel ; .none
            // iOS will render it automatically depending on the context/platform...
            // useful for screen readers: when the screen is read aloud for disabled people
            Button("Delete selection", role: .destructive, action: executeDelete)
            
            Group { //using a Group because 10-element restriction has been reached
                
                // .bordered and .borderedProminent let iOS make the buttons stand out depending on the context
                Button("Button 1") { }
                .buttonStyle(.bordered)
                
                Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
                
                Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                
                Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
                
                // you can add customization after buttonStyle first rendering
                Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            
            // customize a Button from scratch:
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.indigo)
            }
            
            HStack{
                // Image
                Image("pencil") // Image from the asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Image(decorative: "pencil") // Same but won't be read with Screen reader
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Image(systemName: "pencil")
            }
            
            // an alternative way to declare a Button:
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil") // will color it in blue by default because it's part of a Button View
            }
            
            // If a (system) image is part of the Button, use Label instead of Text:
            // it will automatically decide whether to show the icon, the text, or both depending on how they are being used in our layout.
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
            /* Tip: If you find that your images have become filled in with a color, for example showing as solid blue rather than your actual picture, this is probably SwiftUI coloring them to show that they are tappable. To fix the problem, use the renderingMode(.original) modifier to force SwiftUI to show the original image rather than the recolored version.
             */
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

struct ButtonsImages_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsImages()
    }
}

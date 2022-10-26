//
//  ColorAndFrame.swift
//  GuessTheFlag
//
//  Created by tibo on 29/10/2021.
//

import SwiftUI

struct ColorAndFrame: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                // alignment for ZStack: Color and Text will align from the bottomTrailing corner
                Color(red: 1, green: 0.8, blue: 0)
                // Color is a View that takes all space possible
                  //  .blue is the color for this View
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 300)
            // frame modifier allows you to contrain the geometry of the View it applies to
            .ignoresSafeArea(.all, edges: .top)
            // bypass the safe area constraint to the top (near the screen notch)
            
            
            ZStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white) // this color is forced = non-adaptative and won't change if switching from light to dark mode
            }
            .background(.red)
            // even if the red color is applied to the ZStack, only the text has a background red color: it's because the ZStack takes only the space that his children need (here only Text)
            
            HStack(spacing: 0) {
                ZStack {
                    Color.mint
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black) // .black is the color of the modifier 'foregroundColor'
                }
                .frame(width: 200, height: 100)
                .cornerRadius(20)
                
                ZStack{
//                    Color.blue // if activated the gray color of the Color View below will appears grayosh blue
                    Color.secondary // white or black depending on light/dark mode, but there is a translucent effect with white backgrouns of the main  VStack in body and appears gray to our eyes
                }
            }
            
            ZStack {
                Color.indigo
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary) // .primary is the default color for Text in SwiftUI and will render white in dark mode and black in light mode = adaptative
                // Shift + Command + A for switching light/dark mode in Simulator
                    .padding()
                    .border(Color.primary)
                    
            }
            
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }

                Text("Your content")
//                    .foregroundColor(.secondary)
                    .foregroundStyle(.secondary) // there is subtle difference where a hint of red and blue come through Text content: it's called vibrancy
                    .padding(50)
                    .background(.ultraThinMaterial) // this allows some nice opacity effect and ensure your text is readable whatever picture/View is underneath
            }
            
            ZStack {
                Color.indigo
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.secondary) // .secondary has the same behavior as .primary but has a slight transparency, meaning indigo pass through the Text (zoom in the canva to get a better idea)
            }
            .ignoresSafeArea(.all, edges: .bottom)

        }
    }
}

struct ColorAndFrame_Previews: PreviewProvider {
    static var previews: some View {
        ColorAndFrame()
    }
}

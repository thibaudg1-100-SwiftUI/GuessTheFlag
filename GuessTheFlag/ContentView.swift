//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by tibo on 29/10/2021.
//

import SwiftUI

struct FlagView: View { // extracted view for the flag button
    
    let country: String
    
    // for project 15 : accessibility
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    // edit for project 6 challenge:
    @Binding var choice: String?
    var opacityEnabled: Bool {
        if choice == nil { return true}
        else if choice == country { return true}
        return false
    }
    var spinEnabled: Bool {
        if choice == nil { return false}
        else if choice == country { return true}
        return false
    }
    
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 15)
            .opacity(opacityEnabled ? 1 : 0.2)
            .animation(.easeIn(duration: 2), value: opacityEnabled)
            .rotation3DEffect(.degrees(spinEnabled ? 360 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(.easeIn(duration: 3), value: spinEnabled)
            // for project 15 : accessibility
            .accessibilityLabel(labels[country, default: "Unknown flag"])
            
    }
}

struct ContentView: View {
    
    @State private var countries = [ "France", "Estonia", "UK", "US", "Italy", "Nigeria", "Germany", "Ireland", "Monaco", "Poland", "Russia", "Spain"].shuffled()
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var showFinalAlert = false
    
    @State private var playerScore = 0
    
    @State private var theAnswer = Int.random(in: 0...2)
    
    @State private var rounds = 0
    
    @State private var choice: String? = nil
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .mint, location: 0.3),
                .init(color: Color(red: 0.8, green: 0.17, blue: 0.24), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold)) // or: .font(.largeTitle.bold())
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag of:")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[theAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundStyle(.secondary)
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            choice = countries[number] // edit for project 6 challenge
                            checkAnswer(number) // check if the answer is correct
                        }, label: {
//                            Image(countries[number])
//                                .renderingMode(.original) //modifier tells SwiftUI to render the original image pixels rather than trying to recolor them as a button.
//                                .clipShape(RoundedRectangle(cornerRadius: 12))
//                                .shadow(radius: 15)
                            FlagView(country: countries[number], choice: $choice )
                            // edit for challenge of project 3
                            // edit for challenge of project 6
                            
                        })
                            
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                
                Text("Score: \(playerScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                Spacer()
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $showAlert, actions: {
            Button("Continue"){
                continueGame()
            }
            
        }, message: {
            Text(alertMessage)
        })
        .alert(alertTitle, isPresented: $showFinalAlert, actions: {
            Button("Start again"){
                resetGame()
            }
            
        }, message: {
            Text(alertMessage)
        })


    }
    
    func continueGame(){
        countries.shuffle()
        theAnswer = Int.random(in: 0...2)
        choice = nil
    }
    
    func resetGame(){
        playerScore = 0
        rounds = 0
        continueGame()
    }
    
    func checkAnswer(_ number: Int) {
        if number == theAnswer {
            playerScore += 1
            alertTitle = "Correct 🙌"
            alertMessage = "Your total score: \(playerScore)"
        } else {
            alertTitle = "Nope 😬"
            alertMessage = "That's the flag of \(countries[number])"
        }
        rounds += 1
        if rounds > 4 {
            showFinalAlert = true
        } else { showAlert = true }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

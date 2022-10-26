//
//  Stacks.swift
//  GuessTheFlag
//
//  Created by tibo on 29/10/2021.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(spacing: 20){
                Text("1")
                Text("1")
                Text("1")
            }
            HStack{
                Text("1")
                Text("1")
                Text("1")
            }
            HStack(spacing: 50){
                Text("1")
                Text("1")
                Text("1")
            }
        }
    }
}

struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
        Stacks()
    }
}

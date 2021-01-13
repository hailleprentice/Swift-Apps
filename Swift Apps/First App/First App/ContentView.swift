//
//  ContentView.swift
//  First App
//
//  Created by P.M. Student on 1/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                VStack {
                    VStack {
                        Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                             .bold()
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .padding(.leading, 30.0)
                            .padding(.trailing, 30.0)
                        Text(String(game.target))
                            .kerning(2.0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .bold()
                    }
                    HStack {
                        Text("1")
                            .bold()
                        Slider(value: $sliderValue, in: 1.0...100.0)
                        Text("100")
                            .bold()
                    }
                    .padding()
                Button(action: {
                    print("Hello, SwiftUI")
                    alertIsVisible = true
                }) {
                    Text("Hit me")
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                .background(
                    ZStack {
                    Color("ButtonColor")LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                })
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue: Int = Int(sliderValue.rounded())
                    return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome")))
                })
            }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

}

//
//  ContentView.swift
//  Dice
//
//  Created by 瓦井つばさ on 2023/08/11.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = 1
    @State var timer: Timer?
    @State var isRolling = false
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button {
                print("ボタンが押されたよ")
                isRolling = true
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in  randomNumber = Int.random(in: 1...6)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    timer?.invalidate()
                    timer = nil
                    isRolling = false
                }
            } label: {
                Text("サイコロを振る")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

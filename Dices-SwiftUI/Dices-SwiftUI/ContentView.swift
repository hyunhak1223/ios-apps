//
//  ContentView.swift
//  Dices-SwiftUI
//
//  Created by 현학 on 29/10/2020.
//

import SwiftUI

struct ContentView: View {
    //struct 프로퍼티 못바꾸는데 @State 붙여서 가능. 메소드는 mutating 사용
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    // 클로져 안에는 셀프 사용
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct DiceView: View {
        let n: Int
        
        var body: some View {
            Image("dice\(n)")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding()
        }
    }
}

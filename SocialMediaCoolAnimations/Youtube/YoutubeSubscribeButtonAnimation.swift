//
//  YoutubeSubscribeButtonAnimation.swift
//  SocialMediaCoolAnimations
//
//  Created by C7K6SW on 15/02/24.
//

import SwiftUI

struct YoutubeSubscribeButtonAnimation: View {
    @State var subscribedOrNot = false
    @State private var subscribedText = "S...."
    @State private var currentIndex = 0
    let targetText = "ubscribed"
    let timerInterval = 0.09
    @State var degrees=0
    @State var ringing=false
    @State var oCount = 1
    var body: some View {
        
        Button(action: {
            withAnimation {
                subscribedOrNot.toggle()
                
            }
        }, label: {
            HStack(spacing:10){
                if subscribedOrNot {
                    withAnimation(.easeInOut(duration:0.1)) {
                        Image(systemName:"bell") .font(.title)
                            .rotationEffect(.degrees(Double(ringing ? degrees : -degrees)))
                    }
                }
                if subscribedOrNot{
                    Text(subscribedText)
                        .font(.title2)
                        .fontWeight(.bold)
                   
                }
                else{
                    Text("Subscribe")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                }
                if subscribedOrNot {
                    withAnimation(.easeInOut(duration:0.1)) {
                        Image(systemName:"chevron.down")
                    }
                    
                }
                
            }
            .foregroundColor(subscribedOrNot ? .white : .black)
            .padding()
            .padding([.leading,.trailing],5)
            .background(subscribedOrNot ? .white.opacity(0.2) : .white)
            .cornerRadius(30)
        })
        .onChange(of:subscribedOrNot) { oldValue, newValue in
            
            runTimerForText()
            
        }
    }
    func runTimerForText(){
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            let indexToInsertAt = subscribedText.index(subscribedText.startIndex, offsetBy:currentIndex+1)
            guard currentIndex < targetText.count-2 else {
          
                subscribedText="Subscribed"
                timer.invalidate()
              
                bellRing()
                return
            }
            
            let index = targetText.index(targetText.startIndex, offsetBy: currentIndex)
            withAnimation(.easeInOut){
                subscribedText.insert(targetText[index], at: indexToInsertAt)
            }
            currentIndex += 1
        }
    }
    func bellRing(){
        degrees=80
        Timer.scheduledTimer(withTimeInterval:0.2, repeats: true) { timer in
            withAnimation {
                ringing.toggle()
                degrees-=10
                oCount+=1
            }
            if oCount > 6 {
                
                oCount=0
                degrees=0
                timer.invalidate()
                
            }
        }
    }
    
}

#Preview {
    YoutubeSubscribeButtonAnimation()
        .preferredColorScheme(.dark)
}

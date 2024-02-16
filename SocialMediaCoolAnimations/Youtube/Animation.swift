//
//  YoutubeSubscribeButtonAnimation.swift
//  SocialMediaCoolAnimations
//
//  Created by C7K6SW on 15/02/24.
//

import SwiftUI

struct YoutubeSubscribeButtonAnimationss: View {
    @State var subscribedOrNot = false
    @State var isExpanded = false
    @State private var subscribedText = "S...."
  
    @State private var currentIndex = 0
    let targetText = "ubscribed"
    let timerInterval = 0.2 // Adjust the interval as needed
    var body: some View {
        
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                          
                      }
                      
                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                          withAnimation {
                              subscribedOrNot.toggle()
                          }
                      }        }, label: {
                          HStack(spacing:20){
            if subscribedOrNot {
                withAnimation(.easeInOut(duration:0.1)) {
                    Image(systemName:"bell.fill") .font(.title)
                }
               
                    
            }
            
            if subscribedOrNot{
                Text(subscribedText)
                    .font(.title)
                    .fontWeight(.heavy)
            }
                              else{
                                  Text("Subscribe")
                              }
                             
            
            
        }
       
     
   
        .foregroundColor(subscribedOrNot||isExpanded ? .white : .black)
        .padding()
        .padding([.leading,.trailing],5)
        .background(subscribedOrNot||isExpanded ? .white.opacity(0.2) : .white)
        .cornerRadius(30)
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
                let indexToInsertAt = subscribedText.index(subscribedText.startIndex, offsetBy:currentIndex+1)
                guard currentIndex < targetText.count-2 else {
                    subscribedText="Subscribed"
                    timer.invalidate()
                    return
                }
              
                let index = targetText.index(targetText.startIndex, offsetBy: currentIndex)
               // subscribedText.append(targetText[index])
                withAnimation(.easeInOut(duration:0.1)){
                    subscribedText.insert(targetText[index], at: indexToInsertAt)
                }
                currentIndex += 1
            }
        })
        Text("Hellooo")
    }
    
}

#Preview {
    YoutubeSubscribeButtonAnimationss()
        .preferredColorScheme(.dark)
}

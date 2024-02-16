//
//  SkipAdd.swift
//  SocialMediaCoolAnimations
//
//  Created by C7K6SW on 16/02/24.
//

import SwiftUI

struct SkipAdd: View {
    @State var seconds = 5
    var body: some View {
        
        HStack(spacing:0){
            if seconds>0{
                Text("\(seconds)")
                    .foregroundStyle(.white)
                    .frame(width:40,height:50)
                    .background(.black.opacity(0.8))
                
                Image("girl")
                    .resizable()
                    .frame(width:80,height:50)
            }
            if seconds==0{
                skipAdd()
            }
        }
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval:1, repeats:true) { timer in
                seconds-=1
                if seconds<1{
                    seconds=0
                    timer.invalidate()
                }
            }
        })
        .cornerRadius(10)
        
    }
    func skipAdd() -> some View {
        HStack(spacing:10){
            Text("Skip")
            HStack(spacing:5){
                Image(systemName:"play.fill")
                Rectangle().frame(width:1,height:20)
                    .bold()
            }
        }
        .foregroundColor(.white)
        .padding()
        .padding([.leading,.trailing])
        .background(.black.opacity(0.8))
        .cornerRadius(30)
        
        
    }
}

#Preview {
    SkipAdd()
       // .preferredColorScheme(.dark)
}

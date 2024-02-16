//
//  ResizableGrids.swift
//  SocialMediaCoolAnimations
//
//  Created by C7K6SW on 16/02/24.
//

import SwiftUI

struct ResizableGrids: View {
    let columns = [GridItem(.fixed(100), spacing:30, alignment: .center),GridItem(.fixed(100), spacing:30, alignment: .center),
                   GridItem(.fixed(100), spacing:30, alignment: .center)]
    @State var showMore=false
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: columns, content: {
                
                Image(.girl).resizable().frame(width:100, height:100)
                Image(.girl).resizable().frame(width:100, height:100)
                Image(.girl).resizable().frame(width:100, height:100)
                if showMore{
                    Group{
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                        Image(.girl).resizable().frame(width:100, height:100)
                    }
                }
                
            })
            Button(action: {
                withAnimation(.easeInOut(duration:0.5)){
                    showMore.toggle()
                }
               
            }, label: {
                Text(showMore ? "Show Less" : "Show More")
            })
        }
    }
}

#Preview {
    ResizableGrids()
}

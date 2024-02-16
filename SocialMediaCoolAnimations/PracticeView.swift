import SwiftUI
struct YoutubeSubscribeButtonAnimations: View {
    @State private var subscribedOrNot = false
    @State private var subscribedText = ""
    @State private var isExpanded = false
    @State var expandedText="Sub"
    let targetText = "Subscribed"
    let timerInterval = 0.5
    @State private var currentIndex = 0
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                isExpanded.toggle()
            }
            Timer.scheduledTimer(withTimeInterval:0.5, repeats: true) { timer in
                guard currentIndex < targetText.count else {
                                      timer.invalidate()
                                      return
                                  }
                                  let index = targetText.index(targetText.startIndex, offsetBy: currentIndex)
                                 expandedText.append(targetText[index])
                                  currentIndex += 1
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    subscribedOrNot.toggle()
                }
            }
        }) {
            HStack {
                if subscribedOrNot {
                    Image(systemName: "bell").font(.title)
                }
                
                if subscribedOrNot {
                    Text("Subscribed")
                } else {
                    Text(isExpanded ? expandedText : "Subscribe")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                if subscribedOrNot {
                    Image(systemName: "chevron.down")
                }
            }
            .foregroundColor(subscribedOrNot || isExpanded ? .white : .black)
            .padding()
            .padding([.leading, .trailing], 5)
            .background(subscribedOrNot || isExpanded ? Color.white.opacity(0.2) : Color.white)
            .cornerRadius(30)
        }
    }
    
}

struct YoutubeSubscribeButtonAnimations_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeSubscribeButtonAnimations()
            .preferredColorScheme(.dark)
    }
}

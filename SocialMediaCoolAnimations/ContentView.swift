import SwiftUI

struct AnimatedSubscriptionText: View {
    @State private var subscribedText = "S...."
  
    @State private var currentIndex = 0
    let targetText = "ubscribed"
    let timerInterval = 0.2 // Adjust the interval as needed
    @State var subscribedOrNot = false
    var body: some View {
        if subscribedOrNot{
            Text(subscribedText)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .onAppear {
                    
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
                }
        }
            else{
                Text("Subscribe")
                    .onTapGesture {
                        subscribedOrNot.toggle()
                    }
            }
                
            
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            AnimatedSubscriptionText()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

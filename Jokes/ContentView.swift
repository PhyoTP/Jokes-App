//
//  ContentView.swift
//  Jokes
//
//  Created by T Krobot on 29/4/23.
//

import SwiftUI

struct ContentView: View {
    let jokes = [
        Joke(setup: "Today, I asked my phone “Siri, why am I still single?”", punchline: "It activated the front camera"),
        Joke(setup: "What happens when you sing country music backwards? ", punchline: "You get your job and your wife back!"),
        Joke(setup: "I told my wife she was drawing her eyebrows too high.", punchline: "She looked surprised."),
        Joke(setup: "What never eats but is still around?", punchline: "The children in Africa"),
        Joke(setup: "I'm reading a book about anti-gravity.", punchline: "It's impossible to put down."),
        Joke(setup: "I don't trust people that do acupuncture.", punchline: "They're back stabbers."),
        Joke(setup: "I'm on a whiskey diet.", punchline: "I've lost three days already."),
        Joke(setup: "Did you hear about the kidnapping at the playground?", punchline: "He woke up."),
        Joke(setup: "Did you hear about the restaurant on the moon?", punchline: "Great food, no atmosphere."),
        Joke(setup: "I'm so good at sleeping, ", punchline: "I can do it with my eyes closed.")
    ]
    @State private var jokeNum = 0
    @State private var jokeDone = false
    @State private var showAlert = false
    @State private var showSheet = false
    @State private var likeJoke = false
    @State private var punchlineSize = 0.1
    @State private var punchlineRotation = Angle.degrees(0)
    @State private var appLoading = 300.0
    var body: some View {
        ZStack{
            Color(.orange)
                .edgesIgnoringSafeArea([.all])
            VStack{
                Text(jokes[jokeNum].setup)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Button{
                    withAnimation(){
                        jokeDone = true
                        appLoading = 0.0
                    }
                    
                }label: {
                    Text("What?")
                        .foregroundColor(.blue)
                        .background(.linearGradient(colors: [.yellow, .red , .green], startPoint: .topTrailing, endPoint: .bottomLeading))
                        .font(.largeTitle)
                }
                if jokeDone{
                    Text(jokes[jokeNum].punchline)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .scaleEffect(punchlineSize)
                        .rotationEffect(punchlineRotation)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 3)){
                                punchlineSize = 1
                                punchlineRotation = .degrees(3600)
                            }
                        }
                        .onDisappear(){
                            
                                punchlineSize = 0.1
                                punchlineRotation = .degrees(0)
                            
                        }
                    Text("Tap anywhere to continue")
                        .foregroundColor(.gray)
                        .padding(30)
                }
            }
        .padding()
        
        }
        .offset(y: appLoading)
        .alert("Did you like the joke?", isPresented: $showAlert){
            Button("Yes", role: .cancel){
                print("Yay")
                showSheet = true
                likeJoke = true
            }
            Button("No", role: .destructive){
                print("bruh")
                showSheet = true
                likeJoke = false
            }
        }message: {
            Text("DING DING DING DINGGG PUBLIC ADDRESS SYSTEM TEST THIS IS A FUNCTIONAL TEST OF SYSTEMS OPERATION IN THE BUILDING PLEASE DO NOT BE ALARMED THANK YOU")
        }
        .onTapGesture {
            
            if jokeDone == true {
                showAlert = true
                jokeNum += 1
                if jokeNum == 9{
                    jokeNum = 0
                }
                jokeDone = false
            }
        }
        .sheet(isPresented: $showSheet){
            FeedbackView(likeJoke: likeJoke)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

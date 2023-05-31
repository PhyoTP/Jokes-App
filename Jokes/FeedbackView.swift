//
//  FeedbackView.swift
//  Jokes
//
//  Created by T Krobot on 13/5/23.
//

import SwiftUI

struct FeedbackView: View {
    var likeJoke: Bool
    var body: some View {
        ZStack{
            Image(likeJoke ? "happy-happy-happy-cat-1": "bananacat")
            Text(likeJoke ? "YAY": "NOOO")
                .foregroundColor(likeJoke ? .blue: .red)
                .font(.largeTitle)
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(likeJoke: true)
        FeedbackView(likeJoke: false)
    }
}

//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Sean.Lacey on 3/10/23.
//
import AVKit
import SwiftUI


struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        
        
        
        VStack{
            // Only show video if we get valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            //Description
            CodeTextView()
            
            //Next lesson button
            if model.hasNextLesson() {
                Button {
                    
                    model.nextLesson()
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

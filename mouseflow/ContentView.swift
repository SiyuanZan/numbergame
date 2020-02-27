//
//  ContentView.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/20/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var viewState=CGPoint(x:190,y:100)
    @State private var NumberPos1=CGPoint(x:50,y:0)
    @State private var NumberPos2=CGPoint(x:50,y:0)
    //      @State private var numbers=[0,0,0,0,0]
    @State var timeAnimation=false
    @State var textAnimation1 = false
    @State var textAnimation2 = false
    @State  var count2=0;
    @State  var count1=0;

//    @State  var numbers2:[Int]=[0,1,2,3]
    @State private var words=[1,2,3,4,5,6,7,8,9]
    @State var credit1=100
    @State var credit2=0
    @State var end = false
   
    var body: some View {
       
        
        ZStack{
                Color(red:0, green: 0, blue: 0)
            ZStack{
                winPage(credit2: self.$credit2,timeAnimation:self.$timeAnimation)
                       
                   }
//           CollisionObject(viewState:self.$viewState,count1:self.$count1, NumberPos1:self.$NumberPos1,textAnimation1:self.$textAnimation1,timeAnimation:self.$timeAnimation, words:self.$words,credit1:self.$credit1)

          CollisionObject2(viewState:self.$viewState,count2:self.$count2, NumberPos2:self.$NumberPos2,textAnimation2:self.$textAnimation2,timeAnimation:self.$timeAnimation, words:self.$words,credit2:self.$credit2)


          CollisionObject2(viewState:self.$viewState,count2:self.$count2, NumberPos2:self.$NumberPos2,textAnimation2:self.$textAnimation2,timeAnimation:self.$timeAnimation, words:self.$words,credit2:self.$credit2)
            
          
            
            ZStack{
            Avatar(viewState:self.$viewState,credit2:self.$credit2)
               .offset(y:300)
              .onAppear(){
                    self.viewState=CGPoint(x: 190 , y:100 )
            }
            }
            ControllerButtons(timeAnimation:self.$timeAnimation,credit2:self.$credit2)
                .offset(x:-60,y:300)
                .padding()
                .onAppear(){
                        self.timeAnimation=false
                }
          
            winState(credit1: self.$credit1, credit2: self.$credit2)
                .offset(x:110,y:-350)
                
             
        }
            
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

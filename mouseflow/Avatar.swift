//
//  Avatar.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/22/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI
struct Avatar: View {
    @Binding var viewState:CGPoint
    @State var beforeStart = CGPoint()
     @Binding var credit2:Int
    func  ifWin() -> Bool {
         if(self.credit2/30>=20){
          
             return true
             
         }

         return false
     }
    var body:some View{
        GeometryReader { text in
            VStack{
                Text("6")
                    .font(.custom("Helvetica", size: 55))
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    
//                    .frame(width:90, height:30 )
                    //            .offset(x:self.viewState.width)
                    .opacity(self.ifWin() ? 0.0:1.0)
                    .position(self.viewState)
                    .animation(.spring())
                    .gesture(                                               DragGesture(minimumDistance: 0.0, coordinateSpace: CoordinateSpace.global)
                        .onChanged{
                            value in
                            self.viewState=CGPoint(x:value.translation.width+self.beforeStart.x,y:self.beforeStart.y)
                            
                    }
                    .onEnded{value in
                        if (self.viewState.x>380){
                            self.viewState=CGPoint(x:380,y:100)
                            
                            
                        }
                        if(self.viewState.x<0){
                            self.viewState=CGPoint(x:0,y:100)
                        }
                        else{
                            
                            self.viewState=self.beforeStart
                            
                        }
                        }
                )
                    .onAppear() {
                        // Initialize offset on appear.
                        self.beforeStart = self.viewState
                }
                
            }
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { text in Avatar(viewState:.constant(CGPoint(x:190, y:100)),credit2:.constant(0))}
    }
}

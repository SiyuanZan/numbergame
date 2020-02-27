//
//  ControllerButtons.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/22/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct ControllerButtons: View {
    @Binding var timeAnimation:Bool
    @Binding var credit2:Int
    
    //    @Binding  var count:Int
    //    @Binding   var numbers:[Int]
    //    func counter() -> Int {
    //       var a=0
    //        if(a<=6000){
    //            a+=1
    //
    //        }
    //        return a
    //
    //       }
    var body: some View {
        HStack{
            
            Button(action:{
                
                if( self.timeAnimation==false){
                    self.timeAnimation=true}
                
                self.credit2=2
            }){
                Text("START.")
                    .italic()
                    .fontWeight(.heavy)
                    .frame(width:110,height:100)
                    .foregroundColor(.white)
                    .font(.custom("Helvetica", size: 30))
                
                
                
                
                
            }
            Button(action:{
                if(self.timeAnimation==true)
                {
                    self.timeAnimation=false}
                
            }){
                Text("PAUSE")
                    .italic()
                    .fontWeight(.heavy)
                    .frame(width:110,height:100)
                    .foregroundColor(.gray)
                    .font(.custom("Helvetica", size: 30))
            }
            
            
            
            
        }
        
        
        
        
        
        
    }
}



struct ControllerButtons_Previews: PreviewProvider {
    static var previews: some View {
        //    ControllerButtons(timeAnimation: .constant(false), textAnimation: .constant(false), count: .constant(0), numbers: .constant([]))
        GeometryReader { text in  ControllerButtons(timeAnimation :.constant(false),credit2:.constant(0))}
    }}


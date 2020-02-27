//
//  winPage.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/26/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI
struct winPage: View {
    
    @Binding var credit2:Int
    @Binding var timeAnimation:Bool

    func  ifWin() -> Bool {
        if(self.credit2/30>=20){
         
            return true
            
        }

        return false
    }
    var body:some View{
        
        
        ZStack{
            Color(red: 1, green: 0, blue: 0)
            
            Text("YOU WIN !")
                .fontWeight(.heavy)
                .frame(width:300,height:100)
                .foregroundColor(  Color(red: 0, green: 0, blue: 0))
                .font(.custom("Helvetica", size: 40))
            
        }.edgesIgnoringSafeArea(.all)
            .opacity(self.ifWin() ? 1.0:0.0)
        
        
    }
}

struct winPage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { text in  winPage(credit2: .constant(0),timeAnimation:.constant(false))}
    }
}


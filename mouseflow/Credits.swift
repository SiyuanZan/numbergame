//
//  winState.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/24/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI
struct winState: View {
     @Binding var credit1:Int
     @Binding var credit2:Int
     var body:some View{
        ZStack{
            Text("credits:\((self.credit2/30)%20)")
                .fontWeight(.semibold)
             .italic()
            .foregroundColor(  Color(red: 1, green: 1, blue: 1))
            .font(.custom("Helvetica", size: 20))
            
        }
    }
}

struct winState_Previews: PreviewProvider {
    static var previews: some View {
        winState(credit1: .constant(0), credit2: .constant(0))
    }
}


//
//  CollisionObject.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/22/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct CollisionObject2: View {
    @Binding var viewState:CGPoint
    @Binding  var count2:Int
    @Binding var NumberPos2:CGPoint
    @Binding var textAnimation2 :Bool
    @Binding var timeAnimation : Bool
    @State  var numbers2:[Int]=[0,1,2,3]
    @Binding  var words:[Int]
    //    @State private var r=0
    @State var currentPosition2 = [CGPoint(),CGPoint(),CGPoint(),CGPoint()]
    @State var randomNumber2=0
    @State var randomNumberArray2:[Int]=[3,1,4,0]
    @State var colorArray2:[Color]=[.blue,.blue,.blue,.blue]
    @Binding var credit2:Int
    //    @State var randomWords=0
    let timer2=Timer.publish(every: 1/60, on:.main, in: .default).autoconnect()
    let timer=Timer.publish(every: 1/60, on:.main, in: .default).autoconnect()
    
    func isObjectCollision() -> Int {
        switch self.timeAnimation {
        case (self.viewState.x>=40&&self.viewState.x<60&&Int(self.currentPosition2[0].y)>=410&&self.randomNumberArray2[self.randomNumberArray2.count-1]<6):
            
            return 0
        case (self.viewState.x>=140&&self.viewState.x<=160&&Int(self.currentPosition2[1].y)>=410&&self.randomNumberArray2[self.randomNumberArray2.count-2]<6):
            
            return 1
        case (self.viewState.x>=220&&self.viewState.x<=240&&Int(self.currentPosition2[2].y)>=410&&self.randomNumberArray2[self.randomNumberArray2.count-3]<6):
            
            return 2
        case (self.viewState.x>=320&&self.viewState.x<=340&&Int(self.currentPosition2[3].y)>=410&&self.randomNumberArray2[self.randomNumberArray2.count-4]<6):
            
            return 3
            
        default:
            return 4
        }
    }
    func wordsIndex() -> Int {
        let a=arc4random_uniform(9)
        return Int(a)
    }
    func randomSpring()->Double{
        var a=[1.5,2.0,2.5,3.0,3.5,4.0]
        a[0]=a[Int.random(in: 0...a.count-1)]
        return Double(a[0])
    }
//    func randomX()->CGFloat{
//        var a=[10,20,40,60,80,100,120,140,160]
//        a[0]=a[Int.random(in: 0...a.count-1)]
//        return CGFloat(a[0])
//    }
    func animationControl()->Double{
    
        if(self.timeAnimation==true){
            return self.randomSpring()

        }
        else if(self.timeAnimation==false)
        {
            return 0.0
            
        }
            
        return 0.0
    }
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                HStack(alignment:.center,spacing:0){
                    
                    ForEach(0..<self.numbers2.count){number in
                        GeometryReader{geometry in
                            Text("\(self.randomNumberArray2[self.randomNumberArray2.count-number-1])")
                                .font(.custom("Helvetica", size: 40))
                                .fontWeight(.heavy)
                                .frame(width:30, height:100 )
                                .opacity(self.timeAnimation ? 1.0:0.0)
                                .multilineTextAlignment(.center) .foregroundColor(self.colorArray2[self.randomNumberArray2.count-number-1] )
                                .animation(nil)
                                .onReceive(self.timer) {_ in
                                  
                                    self.currentPosition2[number] = CGPoint(x: geometry.frame(in:.global).midX,
                                                                            y: geometry.frame(in: .global).midY)
                                    if((self.credit2/30)%21==20){
                                        self.timeAnimation=false
                                        
                                    }
                            }
                            
                            
                            
                            
                        }
                        .modifier(MoveEffect2(toPosition: self.textAnimation2 ? CGPoint(x:0, y:300) : CGPoint(x: 0, y:-300)))
                        .animation(
                           
                            Animation.easeIn(duration:self.animationControl())
                                .repeatForever(autoreverses: false)
                        )
                        //
                        
                    }
                }
                .onReceive(self.timer2){_ in
                 
                    if(self.timeAnimation){
                        //            self.NumberPos1=CGPoint(x:50,y:150*(self.count1%5))
                        self.count2=self.count2+1
                        if((self.count2%180==0)&&(self.count2>=0)){
                            self.numbers2[0]+=4
                            self.numbers2[1]+=4
                            self.numbers2[2]+=4
                            self.numbers2[3]+=4
                            self.textAnimation2=true
                            if(self.textAnimation2==true){
                                
                                for _ in 0..<4{
                                    self.randomNumber2=self.words[self.wordsIndex()]
                                    self.randomNumberArray2.insert( self.randomNumber2, at:self.randomNumberArray2.endIndex)
                                    self.colorArray2.insert(.blue,at:self.colorArray2.endIndex)
                                }
                                
                                
                                
                            }
                            else{
                                self.textAnimation2=false
                                
                            }
                            
                        }
                            if(self.isObjectCollision()==0){
                                self.colorArray2[self.randomNumberArray2.count-1] = .red
                                self.credit2+=1
                                
                            }else if(self.isObjectCollision()==1){
                                self.colorArray2[self.randomNumberArray2.count-2] = .red
                                self.credit2+=1
                                
                            }else if(self.isObjectCollision()==2){
                                self.colorArray2[self.randomNumberArray2.count-3] = .red
                                self.credit2+=1
                                
                            }
                            else if(self.isObjectCollision()==3){
                                self.colorArray2[self.randomNumberArray2.count-4] = .red
                                self.credit2+=1
                                
                            }
                            else if(self.isObjectCollision()==4){
                                self.colorArray2[self.randomNumberArray2.count-4] = .blue
                                self.colorArray2[self.randomNumberArray2.count-3] = .blue
                                self.colorArray2[self.randomNumberArray2.count-2] = .blue
                                self.colorArray2[self.randomNumberArray2.count-1] = .blue
                                
                            }
//                            
               
                        
                    }
                    else{
                        
                        self.randomNumberArray2=[3,1,4,0]
                    }
                   
                    
                }
                
               
                
            }
            
            
        }
        
    }
}
    
    
    struct CollisionObject2_Previews: PreviewProvider {
        static var previews: some View {
            
            GeometryReader { text in
                CollisionObject2(viewState:.constant(CGPoint(x: 190 , y:300)),count2:.constant(0), NumberPos2:.constant(CGPoint(x:50 , y:0)),textAnimation2:.constant(false),timeAnimation: .constant(false), words: .constant([1,2,3,4,5,6,7,8,9]), credit2: .constant(0))
                
            }
            
            
            
        }}
    
    
    
    // GeometryEffect modifer to move object.
    // Note: Need to use custom modifer to get current position from GeometryReader.
    struct MoveEffect2: GeometryEffect {
        var toPosition: CGPoint = CGPoint()
        
        var animatableData: CGPoint.AnimatableData {
            get { CGPoint.AnimatableData(toPosition.x, toPosition.y) }
            set { toPosition = CGPoint(x: newValue.first, y: newValue.second) }
        }
        
        func effectValue(size: CGSize) -> ProjectionTransform {
            return ProjectionTransform(CGAffineTransform(translationX: toPosition.x, y: toPosition.y))
        }
}

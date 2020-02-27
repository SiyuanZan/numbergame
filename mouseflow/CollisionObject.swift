//
//  CollisionObject.swift
//  mouseflow
//
//  Created by Siyuan Zan on 2/22/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct CollisionObject: View {
    @Binding var viewState:CGPoint
    @Binding  var count1:Int
    @Binding var NumberPos1:CGPoint
    @Binding var textAnimation1 :Bool
    @Binding var timeAnimation:Bool
    @State  var numbers:[Int]=[0,1,2,3]
    @Binding  var words:[Int]
    @State private var r=0
    @State var currentPosition = [CGPoint(),CGPoint(),CGPoint(),CGPoint()]
    @State var randomNumber=0
    @State var randomNumberArray:[Int]=[3,1,4,0]
    @State var colorArray:[Color]=[.blue,.blue,.blue,.blue]
    @Binding var credit1:Int
    //    @State var randomWords=0
    let timer1=Timer.publish(every: 1/60, on:.main, in: .default).autoconnect()
    let timer=Timer.publish(every: 1/60, on:.main, in: .default).autoconnect()
    
    func isObjectCollision() -> Int {
        
        switch self.timeAnimation {
        case (self.viewState.x>=40&&self.viewState.x<60&&Int(self.currentPosition[0].y)>=410&&self.randomNumberArray[self.randomNumberArray.count-1]<6):
            
            return 0
        case (self.viewState.x>=140&&self.viewState.x<=160&&Int(self.currentPosition[1].y)>=410&&self.randomNumberArray[self.randomNumberArray.count-2]<6):
            
            return 1
        case (self.viewState.x>=220&&self.viewState.x<=240&&Int(self.currentPosition[2].y)>=410&&self.randomNumberArray[self.randomNumberArray.count-3]<6):
            
            return 2
        case (self.viewState.x>=320&&self.viewState.x<=340&&Int(self.currentPosition[3].y)>=410&&self.randomNumberArray[self.randomNumberArray.count-4]<6):
            
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
        var a=[1.5,2.0,2.5,3.0]
        a[0]=a[Int.random(in: 0...a.count-1)]
        return Double(a[0])
    }
//    func randomX()->CGFloat{
//        var a=[10,20,40,60,80,100,120,140,160]
//        a[0]=a[Int.random(in: 0...a.count-1)]
//        return CGFloat(a[0])
//    }
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                HStack(alignment:.center,spacing:0){
                    
                    
                    ForEach(0..<self.numbers.count){number in
                        GeometryReader{geometry in
                            Text("\(self.randomNumberArray[self.randomNumberArray.count-number-1])")
                                //                            Text("\(Int(self.currentPosition[number].y))")
                                .font(.title)
                                .fontWeight(.heavy)
                                .frame(width:30, height:100 )
                                .multilineTextAlignment(.center).foregroundColor(self.colorArray[self.randomNumberArray.count-number-1] )
                                .animation(nil)
                                
                                .onReceive(self.timer) {_ in
                                    self.currentPosition[number] = CGPoint(x: geometry.frame(in:.global).midX,
                                                                           y: geometry.frame(in: .global).midY)
                                    
                                    
                            }
                            
                            
                            
                            
                        }
                        .modifier(MoveEffect(toPosition: self.textAnimation1 ? CGPoint(x:0, y:300) : CGPoint(x: 0, y:-300)))
                        .animation(self.timeAnimation ?  Animation.easeIn(duration: self.randomSpring()).repeatForever(autoreverses: false):nil)
                        //                         .animation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false))
                        
                    }
                }
                .onReceive(self.timer1){_ in
                    
                    if(self.timeAnimation){
                        //            self.NumberPos1=CGPoint(x:50,y:150*(self.count1%5))
                        self.count1=self.count1+1
                        if((self.count1%180==0)&&(self.count1>=0)){
                            self.numbers[0]+=4
                            self.numbers[1]+=4
                            self.numbers[2]+=4
                            self.numbers[3]+=4
                            self.textAnimation1=true
                            if(self.textAnimation1==true){
                                
                                for _ in 0..<4{
                                    self.randomNumber=self.words[self.wordsIndex()]
                                    self.randomNumberArray.insert( self.randomNumber, at:self.randomNumberArray.endIndex)
                                    self.colorArray.insert(.blue,at:self.colorArray.endIndex)
                                }
                                
                            }
                            
                            
                        }
                        else{
                            self.textAnimation1=false
                            
                        }
                    }
                        
                        if(self.isObjectCollision()==0){
                            self.colorArray[self.randomNumberArray.count-1] = .red
                            self.credit1+=1
                            
                        }else if(self.isObjectCollision()==1){
                            self.colorArray[self.randomNumberArray.count-2] = .red
                            self.credit1+=1
                            
                        }else if(self.isObjectCollision()==2){
                            self.colorArray[self.randomNumberArray.count-3] = .red
                            self.credit1+=1
                            
                        }
                        else if(self.isObjectCollision()==3){
                            self.colorArray[self.randomNumberArray.count-4] = .red
                            self.credit1+=1
                            
                        }
                        else if(self.isObjectCollision()==4){
                            self.colorArray[self.randomNumberArray.count-4] = .blue
                            self.colorArray[self.randomNumberArray.count-3] = .blue
                            self.colorArray[self.randomNumberArray.count-2] = .blue
                            self.colorArray[self.randomNumberArray.count-1] = .blue
                            
                        }
                        
                        
                        //                        print( self.randomNumberArray[self.randomNumberArray.count-1])
                        print(self.viewState.x)
                    }
                }
                
                
            }
            
            
        }
        
        
    }
    



struct CollisionObject_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { text in
            CollisionObject(viewState:.constant(CGPoint(x: 190 , y:300)),count1:.constant(0), NumberPos1:.constant(CGPoint(x:50 , y:0)),textAnimation1:.constant(false),timeAnimation: .constant(false), words: .constant([1,2,3,4,5,6,7,8,9]), credit1: .constant(0))
            
        }
        
        
        
    }}



// GeometryEffect modifer to move object.
// Note: Need to use custom modifer to get current position from GeometryReader.
struct MoveEffect: GeometryEffect {
    var toPosition: CGPoint = CGPoint()
    
    
    var animatableData: CGPoint.AnimatableData {
        
        get { CGPoint.AnimatableData(toPosition.x, toPosition.y) }
        set { toPosition = CGPoint(x: newValue.first, y: newValue.second) }
        
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        return ProjectionTransform(CGAffineTransform(translationX: toPosition.x, y: toPosition.y))
        
        
    }
}

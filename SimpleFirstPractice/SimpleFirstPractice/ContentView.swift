//
//  ContentView.swift
//  SimpleFirstPractice
//
//  Created by 노주영 on 2023/10/11.
//

import SwiftUI

//MARK: 예제 1
struct ContentView: View {
    @State private var number1: String = ""
    @State private var number2: String = ""
    
    @State private var add: String = ""
    @State private var sub: String = ""
    @State private var mul: String = ""
    @State private var div: String = ""
    
    var body: some View{
        VStack {
            Text("사칙연산")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)
                .multilineTextAlignment(.center)
            
            HStack{
                TextField("1", text: $number1)
                     .multilineTextAlignment(.center)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .border(.purple, width: 2)
                     .cornerRadius(5)
                     .padding(.leading, 5)
                     .padding(.trailing, 5)
                
                     
                
                TextField("2", text: $number2)
                     .multilineTextAlignment(.center)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .border(.purple, width: 2)
                     .cornerRadius(5)
                     .padding(.leading, 5)
                     .padding(.trailing, 5)
                     
                
                Button(action: self.touchInSide, label: {
                    Image(systemName: "checkmark.square")
                        .resizable(resizingMode: .tile)
                        .frame(width: 30.0, height: 30.0)
                        .foregroundStyle(.purple)
                })
            }.padding(30)
            
            HStack{
                VStack{
                    Text("더하기")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text("↓")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text(add)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                }.padding(10)
                
                VStack{
                    Text("빼기")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text("↓")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text(sub)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                }.padding(10)
                
                VStack{
                    Text("곱하기")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text("↓")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text(mul)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                }.padding(10)
                
                VStack{
                    Text("나누기")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text("↓")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                    
                    Text(div)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                }.padding(10)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .border(.purple, width: 2)
            .padding(.top, 30)
            .cornerRadius(5)
        }
        .padding(10)
    }
    
    func touchInSide(){
        if self.number1 != "" && self.number2 != "" {
            self.add = String(Int(number1)!+Int(number2)!)
            self.sub = String(Int(number1)!-Int(number2)!)
            self.mul = String(Int(number1)!*Int(number2)!)
            
            if Int(number1)!%Int(number2)! == 0 {
                self.div = String(Int(number1)!/Int(number2)!)
            } else {
                self.div = String(format: "%.2f", Double(number1)!/Double(number2)!)
            }
        }
    }
}


//MARK: 예제2
struct ContentView2: View{
    @State private var orangeCount: String = ""
    @State private var boxCount: String = ""
    
    @State private var resultOrange: String = ""
    @State private var resultBox: String = ""
    
    var body: some View{
        VStack{
            Text("귤 나누기")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
            
            HStack{
                Image(systemName: "applelogo")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                
                TextField("귤 갯수", text: $orangeCount)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.orange, width: 2)
                    .padding(.top, 10)
                    .padding(10)
            }
            .padding(10)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
            HStack{
                Image(systemName: "shippingbox")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                
                TextField("박스의 수", text: $boxCount)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.orange, width: 2)
                    .padding(10)
            }
            .padding(10)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
            Button(action: self.touchInSide, label: {
                Text("↓")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
            })
            
            HStack{
                Image(systemName: "applelogo")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                
                Image(systemName: "multiply.circle")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                    .padding(.top, 10)
                    .padding(10)
                
                Text(resultOrange)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
            }
            .padding(10)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            
            HStack{
                Image(systemName: "shippingbox")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                
                Image(systemName: "multiply.circle")
                    .resizable(resizingMode: .tile)
                    .frame(width: 40.0, height: 50.0)
                    .foregroundStyle(.orange)
                    .padding(10)
                
                Text(resultBox)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                
            }
            .padding(10)
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
    }
    
    func touchInSide(){
        if self.orangeCount != "" && self.boxCount != ""{
            self.resultOrange = String(Int(self.orangeCount)!%Int(self.boxCount)!)
            self.resultBox = String(Int(self.orangeCount)!/Int(self.boxCount)!)
        }
    }
}

//예제3,4
struct ContentView3: View {
    @State private var number1: String = ""
    @State private var result: String = ""
    
    var body: some View{
        VStack{
            Text("일의 자리 1로 바꾸기")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            TextField("ex) 456", text: $number1)
                .multilineTextAlignment(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black, width: 2)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(20)
            
            Button(action: self.touchInSide, label: {
                if let _ = Int(self.number1){
                    Text("↓")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
            })
            
            Text(result)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(20)
        }
    }
    func touchInSide(){
        self.result = String(Int(self.number1)!/10*10+1)
        self.number1 = ""
    }
}

//예제 5
struct ContentView4: View {
    @State private var swiftNum: String = ""
    @State private var iosNum: String = ""
    @State private var webNum: String = ""
    
    @State private var result: String = ""
    
    var body: some View {
        VStack{
            Text("평균 구하기")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            HStack{
                Text("Swift")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(width: 80, height: 30)
                
                TextField("점수", text: $swiftNum)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.gray, width: 2)
                    .cornerRadius(5.0)
            }
            .padding()
            
            HStack{
                Text("iOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(width: 80, height: 30)
                
                TextField("점수", text: $iosNum)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.gray, width: 2)
                    .cornerRadius(5.0)
            }
            .padding()
            
            HStack{
                Text("Web")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(width: 80, height: 30)
                
                TextField("점수", text: $webNum)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(.gray, width: 2)
                    .cornerRadius(5.0)
            }
            .padding()
            
            Button(action: self.touchInSide, label: {
                if self.swiftNum != "" && self.iosNum != "" && self.webNum != "" {
                    Text("↓")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
            })
            
            Text(result)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(20)
            
        }
    }
    func touchInSide(){
        guard let changeSwift = Double(self.swiftNum) else { return }
        guard let changeiOS = Double(self.iosNum) else { return }
        guard let changeWeb = Double(self.webNum) else { return }
        let add = changeSwift+changeiOS+changeWeb
        
        if add.truncatingRemainder(dividingBy: 3.0) == 0 {
            self.result = "\(Int(add/3))"
        } else {
            self.result = String(format: "%.2f", add/3)
        }
    }
}

#Preview {
    //ContentView()
    //ContentView2()
    //ContentView3()
    ContentView4()
}

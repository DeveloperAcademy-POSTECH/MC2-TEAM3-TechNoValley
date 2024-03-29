import SwiftUI

struct RollingText: View {
    // MARK: Text Properties
    var font: Font = .custom("esamanruOTFLight", size: 35)
    var weight: Font.Weight = . regular
    // MARK: Animation properties
    @Binding var value: Int
    @State var animationRange: [Int] = []
    @State private var stepsCount: Int = 0
    
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(0..<animationRange.count,id: \.self){index in
                //MARK: To Find Text Size for Given Font
                //Random Number
                Text ("8")
                    .font (font)
                    .fontWeight (weight)
                    .opacity (0)
                    .overlay {
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            VStack(spacing: 0){
                                //MARK: Since Its Individual Value
                                // We Need From 0-9
                                ForEach(0...9,id: \.self){number in
                                    Text ("\(number)")
                                        .font (font)
                                        .fontWeight (weight)
                                        .frame (width: size.width, height:
                                                    size.height, alignment: .center)
                                }
                            }
                            // MARK: Setting Offset
                            .offset(y: -CGFloat(animationRange[index]) * size.height
                            )
                        }
                        .clipped()
                    }
            }
        }
        .onAppear{
            // MARK: Loading Range
            animationRange = Array(repeating: 0, count: "\(value)".count)
            //Starting with Littel Delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06){
                updateText()
            }
        }
        .onChange(of: value) { newValue in
            let extra = "\(value)".count - animationRange.count
            if extra > 0{
                //Adding Extra Range
                for _ in 0..<extra{
                    withAnimation(.easeIn(duration: 0.1)){animationRange.append(0)}
                    
                }
                
            }else{
                // Removing Extra Range
                for _ in 0..<extra{
                    withAnimation(.easeIn(duration: 0.1)){animationRange.removeLast()}
                    
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                updateText()
            }
        }
    }
    func updateText(){
        let stringValue = "\(value)"
        for (index,value) in zip(0..<stringValue.count, stringValue){
            //If First Value = 1
            //Then Offset will be Applied for -1
            //So the text will move up to show 1 Value
            
            //MARK: DampingFraction based on Index
            var fraction = Double (index) * 0.15
            // Max = 0.5
            // Total = 1.5
            fraction = (fraction > 0.5 ? 0.5 : fraction)
            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1, blendDuration: 1)){
                animationRange[index] = (String(value) as NSString).integerValue
            }
        }
    }
}


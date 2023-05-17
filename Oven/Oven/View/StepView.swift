import SwiftUI
import CoreMotion

struct StepView: View {
    
    // CMMotionActivityManager
    private let activityManager = CMMotionActivityManager()
    
    // CMPedometer
    private let pedometer = CMPedometer()
    @State var stepsCount: Int = 0
    @State var stepsCount2: Int = 0
    @State var stepsCount3: Int = 0
    @State var stepDiff: Int = 0
    @State var stepDiffSum: Int = 0
    @State var firstText: String = "5분간의 산책을 시작해봐요"
    
    
    
    
    @State var StringList: [String] = ["시작은 언제나 첫 걸음 부터",
                                       "신선한 공기를 한껏 마시고 출발해봐요!",
                                       "평소에 가보지 않았던 곳으로 가보는건 어때요?",
                                       "멋진 시작이에요!",
                                       "집중하느라 뭉쳐있던 손발을 조금씩 풀어주세요.",
                                       "곳곳에 숨어있는 돌맹이들을 조심하세요.",
                                       "이제 몸이 조금 따뜻해졌나요?",
                                       "때론 느긋한 마음을 가지는 것도 좋아요",
                                       "고개를 들어 넓은 세상을 둘러봐요",
                                       "손과 발의 감촉에 집중하며 걸어보세요.",
                                       "고개를 들어 넓은 세상을 둘러봐요",
                                       "손과 발의 감촉에 집중하며 걸어보세요.",
                                       "지금 당신은 어떤 풍경을 보고있나요?",
                                       "새로운 곳에 새로운 인연이 있을지도 몰라요",
                                       "경쾌한 발걸음으로 함께한지 어느새 500보!",
                                       "걷다 힘들면 잠깐 쉬어가도 괜찮아요",
                                       "산책은 힘들지 않은 정도가 딱 좋아요",
                                       "설마 지금 뛰고있는건 아니죠?",
                                       "혹시 육상선수세요?",
                                       "부정행위를 의심케 할 정도로 멀리 왔어요!"]
    // 다양한 글귀 추가, 첫 걸음 전에 안내 문구 추가
    
    var body: some View {
        
        
        ZStack {
            
            Color(red: 0.15, green: 0.15, blue: 0.15)
                .ignoresSafeArea()
            
            TimerView(timeRemaining: 300)
                .offset(x:130, y:-330)
            //지구 타이머 오프셋 사용
            
            
                
            VStack(spacing: 70) {
                

                
                
                Spacer()

                
                
                Spacer()
                
                HStack(spacing:-3.2){
                    
                    RollingText(value: $stepsCount3)
                        
                        .frame(width: 36, height: 80)
                        .padding()
                        .border(Color(hex: "FFBC00"), width: 3.5)
                        .cornerRadius(3)
                        .foregroundColor(.white)

                    
                    RollingText(value: $stepsCount2)
                        
                        .frame(width: 36, height: 80)
                        .padding()
                        .border(Color(hex: "FFBC00"), width: 3.5)
                        .foregroundColor(.white)
                    
                    RollingText(value: Binding(get: { self.stepsCount % 10 },
                                               set: { self.stepsCount = $0 }))
                    
                    .frame(width: 36, height: 80)
                    .padding()
                    .border(Color(hex: "FFBC00"), width: 3.5)
                    .cornerRadius(3)
                    .foregroundColor(.white)
                    
    //                RoundedRectangle(cornerRadius: 10)
    //                    .frame(width: 51, height: 51)
    //                    .foregroundColor(Color(hex: "252526"))
    //                    .overlay(Text("\(timeMinutes)")
    //                        .font(.largeTitle)
    //                        .foregroundColor(.black))
    //                    .clipShape(RoundedRectangle(cornerRadius: 10))
    //                    .overlay(
    //                        RoundedRectangle(cornerRadius: 10)
    //                            .stroke(Color(hex: "FFBC00"), lineWidth: 3.5)
    //                    )
                    
                }
                .onAppear() {
                    // CMMotionActivityManager
                    
                    
                    // CMPedometer
                    if CMPedometer.isStepCountingAvailable() {
                        pedometer.startUpdates(from: Date()) { pedometerData, error in
                            if let pedometerData = pedometerData, error == nil {
                                DispatchQueue.main.async {
                                    let newSteps = pedometerData.numberOfSteps.intValue
                                    stepDiff = newSteps - self.stepsCount
                                    // 이전 값 빼고 새로운 스텝 수 차이 계산
                                    
                                    
                                    self.stepsCount += stepDiff // 차이만큼만 더해 업데이트
                                    stepDiffSum += stepDiff
                                    updateSteps()
                                   
                                    
                                    
                                }
                            }
                        }
                    }
                }
                
                    
                
                
                switch stepsCount {
                case 0...20:
                    Text(firstText)
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 21...100:
                    Text(StringList[Int.random(in: 0...2)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 101...200:
                    Text(StringList[Int.random(in: 3...5)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                    
                case 201...300:
                    Text(StringList[Int.random(in: 6...7)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 301...400:
                    Text(StringList[Int.random(in: 8...9)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 401...500:
                    Text(StringList[Int.random(in: 10...11)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 501...600:
                    Text(StringList[Int.random(in: 12...13)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 601...800:
                    Text(StringList[Int.random(in: 14...15)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                case 801...999:
                    Text(StringList[Int.random(in: 16...17)])
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .font(.custom("esamanruOTFLight", size: 15))
                default:
                    Text("오류")
                }
                Spacer()
            
                Spacer()
                
                
            }
        }
        
        
        
        
        
    }
    
    func updateSteps() {
        withAnimation {
            if stepDiffSum >= 10 {
                stepDiffSum -= 10
                stepsCount2 += 1
            }
            if stepsCount2 >= 10 {
                stepsCount2 = 0
                stepsCount3 += 1
            }
            
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView()
        TimerView(timeRemaining: 300)
    }
}

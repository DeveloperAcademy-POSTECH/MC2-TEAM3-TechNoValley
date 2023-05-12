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
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                TimerView()
                    .padding(20)
            }
            
            Spacer()
            
            HStack(spacing:-2){
                
                RollingText(value: $stepsCount3)
                    .font(.title)
                    .padding()
                    .border(Color(hex: "FFBC00"), width: 2)
                
                RollingText(value: $stepsCount2)
                    .font(.title)
                    .padding()
                    .border(Color(hex: "FFBC00"), width: 2)
                
                RollingText(value: Binding(get: { self.stepsCount % 10 },
                                           set: { self.stepsCount = $0 }))
                .font(.title)
                .padding()
                .border(Color(hex: "FFBC00"), width: 2)
                
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
                                print(newSteps)
                                print(stepDiff) // 차이값
                                print(self.stepsCount)
                                
                                
                            }
                        }
                    }
                }
            }
            Spacer()
            
            switch stepDiffSum {
            case 0...100:
                Text(StringList[Int.random(in: 0...2)])
            case 101...200:
                Text(StringList[Int.random(in: 3...5)])
            case 201...300:
                Text(StringList[Int.random(in: 6...7)])
            case 301...400:
                Text(StringList[Int.random(in: 8...9)])
            case 401...500:
                Text(StringList[Int.random(in: 10...11)])
            case 501...600:
                Text(StringList[Int.random(in: 12...13)])
            case 601...800:
                Text(StringList[Int.random(in: 14...15)])
            case 801...999:
                Text(StringList[Int.random(in: 16...17)])
            default:
                Text("오류")
            }
            Spacer()
            
            Spacer()
            
            Spacer()
            
            
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
        TimerView()
    }
}

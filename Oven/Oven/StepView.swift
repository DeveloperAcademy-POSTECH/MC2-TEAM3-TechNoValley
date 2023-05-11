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
    
    var body: some View {
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
    }
}

import SwiftUI
import CoreMotion

struct StepView: View {
    
    // CMMotionActivityManager
    private let activityManager = CMMotionActivityManager()

    
    // CMPedometer
    private let pedometer = CMPedometer()
    @State var stepsCount: Int = 0
    
    var body: some View {
        VStack {
            
            RollingText(value: $stepsCount)
                .font(.title)
                .padding()
        }
        .onAppear() {
            // CMMotionActivityManager

            
            // CMPedometer
            if CMPedometer.isStepCountingAvailable() {
                pedometer.startUpdates(from: Date()) { pedometerData, error in
                    if let pedometerData = pedometerData, error == nil {
                        DispatchQueue.main.async {
                            self.stepsCount = pedometerData.numberOfSteps.intValue
                            updateSteps()
                        }
                    }
                }
            }
        }
    }
    
    func updateSteps() {
        withAnimation {
            // stepsCount 값을 업데이트합니다.
            stepsCount += 1
        }
    }
}

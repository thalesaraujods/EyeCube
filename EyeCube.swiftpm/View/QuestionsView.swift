import SwiftUI

struct QuestionsView: View {
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading){
            Text("questions_message1")
                .font(.custom("SF Pro", size: 17, relativeTo: .body))
                .padding(.bottom, 10)
            HStack (spacing: 50){
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "r.circle")
                        Text("→ Right")
                    }
                    HStack {
                        Image(systemName: "l.circle")
                        Text("→ Left")
                    }
                    HStack {
                        Image(systemName: "u.circle")
                        Text("→ Up")
                    }
                }
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "d.circle")
                        Text("→ Down")
                    }
                    HStack {
                        Image(systemName: "f.circle")
                        Text("→ Front")
                    }
                    HStack {
                        Image(systemName: "b.circle")
                        Text("→ Back")
                    }
                }
            }
            .padding(.leading, 50)
            .padding(.bottom, 25)
            
            Text("questions_message2")
                .font(.custom("SF Pro", size: 17, relativeTo: .body))
                .padding(.bottom, 10)
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "r.circle")
                    Text("questions_rotation_clockwise")
                    Image(systemName: "arrow.trianglehead.clockwise.rotate.90")
                }
                HStack {
                    Image("r_anticlockwise2")
                        .resizable()
                        .frame(width: screenWidth*0.043, height: screenHeight*0.020)
                    
                    Text("questions_rotation_antiClockwise")
                    Image(systemName: "arrow.trianglehead.counterclockwise.rotate.90")
                }
            }
            .padding(.leading, 60)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    QuestionsView()
}

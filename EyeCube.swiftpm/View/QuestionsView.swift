import SwiftUI

struct QuestionsView: View {
    
    // dimensoes
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Text("Os botões na tela seguem um padrão de letras para representar cada face do cubo:")
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
            Text("Letras com um apóstrofo (') indicam rotação no sentido anti-horário, enquanto letras sem apóstrofo indicam rotação no sentido horário:")
            VStack {
                HStack {
                    Image(systemName: "r.circle")
                    Text("→ Rotação horária")
                    Image(systemName: "arrow.trianglehead.clockwise.rotate.90")
                }
                HStack {
                    Image("r_anticlockwise")
                        .resizable()
                        .frame(width: screenWidth*0.043, height: screenHeight*0.020)
                    
                    Text("→ Rotação anti-horária")
                    Image(systemName: "arrow.trianglehead.counterclockwise.rotate.90")
                }
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    QuestionsView()
}

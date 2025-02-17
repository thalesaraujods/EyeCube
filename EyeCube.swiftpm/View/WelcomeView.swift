import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 31){
            Text("Nosso objetivo é possibilitar que pessoas tetraplégicas possam resolver o cubo mágico utilizando a tecnologia do Eye Tracking.")
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Text("Dicas Importantes:")
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            
            VStack {
                HStack {
                    Image(systemName: "eye")
                    Text("Ative o EyeTracking")
                }
                Text("Acesse Ajustes → Acessibilidade → Controle por Olhar")
            }
            
            VStack {
                HStack {
                    Image(systemName: "iphone")
                    Text("Ajuste a altura do dispositivo")
                }
                Text("Mantenha o dispositivo estável e alinhado com seus olhos.")
            }
            
            VStack {
                HStack {
                    Image(systemName: "face.smiling")
                    Text("Aproveite a jornada")
                }
                Text("Desafie-se e divirta-se ao longo do caminho. Cada movimento é um passo rumo à solução!")
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    WelcomeView()
}


import SwiftUI

public struct BackgroundComponent: View {

    @State private var hueRotation = false

    public init() { }

    public var body: some View {
        ZStack(alignment: .leading)  {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.blueBright.opacity(0.6), Color.blueDark.opacity(0.6)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )

            Text("Slide to reveal")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
       
    }

}

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0

    var totalTip: Double {
        let bill = Double(billAmount) ?? 0
        let tip = bill * tipPercentage / 100
        return tip
    }

    var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill + totalTip
    }

    var body: some View {
        VStack(spacing: 25) {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Image("tip-calc-picture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .clipped()
            Spacer()
            TextField("Enter bill amount", text: $billAmount)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            Text("Tip Percentage: \(Int(tipPercentage))%")
                .font(.headline)
            Slider(value: $tipPercentage, in: 0...30, step: 1)
                .accentColor(.blue)
                .padding(.horizontal)
            Text("Total Tip: $\(totalTip, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
            Text("Total Amount: $\(totalAmount, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
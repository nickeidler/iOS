import SwiftUI
import Shared

@available(iOS 17.0, *)
struct WidgetsSettingsAddTemplateView: View {
    @State private var entry = WidgetGaugeEntry(
        gaugeType: .normal,
        value: 0.0,
        valueLabel: nil,
        label: nil,
        min: nil,
        max: nil,
        runAction: false,
        action: nil
    )

    var body: some View {
            Form {
                Section(header: Text("Gauge Settings")) {
                    Picker("Gauge Type", selection: $entry.gaugeType) {
                        ForEach(GaugeTypeAppEnum.allCases) { type in
                            Text(type.rawValue.capitalized).tag(type)
                        }
                    }

                    TextField("Value", value: $entry.value, format: .number)

                    if entry.gaugeType != .singleLabel {
                        TextField("Min Label", text: Binding($entry.min, default: ""))
                        TextField("Max Label", text: Binding($entry.max, default: ""))
                    }

                    if entry.gaugeType == .singleLabel || entry.gaugeType == .capacity {
                        TextField("Label", text: Binding($entry.label, default: ""))
                    }

                    TextField("Value Label", text: Binding($entry.valueLabel, default: ""))

                    Toggle("Run Action", isOn: $entry.runAction)

//                    if entry.runAction {
//                        TextField("Action Name", text: Binding($entry.action?.name, default: ""))
//                        // Add other fields related to action if necessary
//                    }
                }
            }
            .navigationTitle("Widget Gauge Entry")
        }
}

// Helper to handle optional binding
extension Binding {
    init(_ source: Binding<Value?>, default defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}

#Preview {
    NavigationView {
        if #available(iOS 17.0, *) {
            WidgetsSettingsAddTemplateView()
        }
    }
}

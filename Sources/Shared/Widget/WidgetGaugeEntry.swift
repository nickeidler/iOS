import AppIntents
import WidgetKit

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public enum GaugeTypeAppEnum: String, Codable, Sendable, AppEnum, Identifiable {
    /// Represents a `Gauge` with style `accessoryCircular` and min/max labels.
    case normal

    /// Represents a `Gauge` with style `accessoryCircular` that has no min / max labels set.
    case singleLabel

    /// Represents a `Gauge` with style `accessoryCircularCapacity`.
    case capacity
    
    public var id: String {
        self.rawValue
    }

    public static let typeDisplayRepresentation = TypeDisplayRepresentation(
        name: .init("widgets.gauge.parameters.gauge_type", defaultValue: "GaugeType")
    )
    public static var caseDisplayRepresentations: [GaugeTypeAppEnum: DisplayRepresentation] = [
        .normal: DisplayRepresentation(title: .init(
            "widgets.gauge.parameters.gauge_type.normal",
            defaultValue: "Normal"
        )),
        .singleLabel: DisplayRepresentation(title: .init(
            "widgets.gauge.parameters.gauge_type.singleLabel",
            defaultValue: "Normal (single label)"
        )),
        .capacity: DisplayRepresentation(title: .init(
            "widgets.gauge.parameters.gauge_type.capacity",
            defaultValue: "Capacity"
        )),
    ]
}

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct WidgetGaugeEntry: TimelineEntry {
    public var date = Date()

    public var gaugeType: GaugeTypeAppEnum

    public var value: Double

    public var valueLabel: String?
    public var label: String?
    public var min: String?
    public var max: String?

    public var runAction: Bool
    public var action: Action?
    
    public init(
        date: Date = Date(),
        gaugeType: GaugeTypeAppEnum,
        value: Double,
        valueLabel: String? = nil,
        label: String? = nil,
        min: String? = nil,
        max: String? = nil,
        runAction: Bool,
        action: Action? = nil
    ) {
        self.date = date
        self.gaugeType = gaugeType
        self.value = value
        self.valueLabel = valueLabel
        self.label = label
        self.min = min
        self.max = max
        self.runAction = runAction
        self.action = action
    }
}

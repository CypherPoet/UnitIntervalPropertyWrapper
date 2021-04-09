import ClampedPropertyWrapper


@propertyWrapper
public struct UnitInterval<Value: FloatingPoint> {
    
    @Clamped(within: 0...1)
    public var wrappedValue: Value = .zero
    
    
    // MARK: - Init
    public init(wrappedValue defaultValue: Value) {
        self.wrappedValue = defaultValue
    }
}

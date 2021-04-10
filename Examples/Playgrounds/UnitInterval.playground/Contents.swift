import UnitIntervalPropertyWrapper


struct AwesomePhoto {
    @UnitInterval
    public var opacity: Double
    
    @UnitInterval
    public var animationProgress: Double = 0.0
}


var photo = AwesomePhoto(opacity: 100)


photo.opacity
photo.animationProgress

photo.animationProgress = -2.2

photo.animationProgress

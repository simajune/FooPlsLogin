//
// FOOPLSView.swift
// Generated by Core Animator version 1.5 on 29/11/2017.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class _FOOPLSPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class FOOPLSView : UIView, CAAnimationDelegate {

	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup
	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:375, height:667)
		__scaling__.center = CGPoint(x:187.5, y:333.5)
		__scaling__.clipsToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let group3__root = _FOOPLSPassthroughView()
		let group3__xScale = _FOOPLSPassthroughView()
		let group3__yScale = _FOOPLSPassthroughView()
		let group3 = UIImageView()
		let imgGroup3 = UIImage(named:"Group 3.png", in: bundle, compatibleWith: nil)
		if imgGroup3 == nil {
			print("** Warning: Could not create image from 'Group 3.png'")
		}
		group3.image = imgGroup3
		group3.contentMode = .center
		group3.bounds = CGRect(x:0, y:0, width:123.0, height:110.0)
		group3__root.layer.position = CGPoint(x:187.500, y:333.500)
		group3__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		group3__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		group3__root.transform = CGAffineTransform(rotationAngle: 0.000)
		group3__root.addSubview(group3__xScale)
		group3__xScale.addSubview(group3__yScale)
		group3__yScale.addSubview(group3)
		__scaling__.addSubview(group3__root)
		viewsByName["Group 3__root"] = group3__root
		viewsByName["Group 3__xScale"] = group3__xScale
		viewsByName["Group 3__yScale"] = group3__yScale
		viewsByName["Group 3"] = group3

		let leftLeg__root = _FOOPLSPassthroughView()
		let leftLeg__xScale = _FOOPLSPassthroughView()
		let leftLeg__yScale = _FOOPLSPassthroughView()
		let leftLeg = UIImageView()
		let imgLeftLeg = UIImage(named:"LeftLeg.png", in: bundle, compatibleWith: nil)
		if imgLeftLeg == nil {
			print("** Warning: Could not create image from 'LeftLeg.png'")
		}
		leftLeg.image = imgLeftLeg
		leftLeg.contentMode = .center
		leftLeg.layer.anchorPoint = CGPoint(x:0.950, y:0.113)
		leftLeg.bounds = CGRect(x:0, y:0, width:64.0, height:49.0)
		leftLeg__root.layer.position = CGPoint(x:151.698, y:412.198)
		leftLeg__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		leftLeg__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		leftLeg__root.transform = CGAffineTransform(rotationAngle: 6.112)
		leftLeg__root.addSubview(leftLeg__xScale)
		leftLeg__xScale.addSubview(leftLeg__yScale)
		leftLeg__yScale.addSubview(leftLeg)
		__scaling__.addSubview(leftLeg__root)
		viewsByName["LeftLeg__root"] = leftLeg__root
		viewsByName["LeftLeg__xScale"] = leftLeg__xScale
		viewsByName["LeftLeg__yScale"] = leftLeg__yScale
		viewsByName["LeftLeg"] = leftLeg

		let rightLeg__root = _FOOPLSPassthroughView()
		let rightLeg__xScale = _FOOPLSPassthroughView()
		let rightLeg__yScale = _FOOPLSPassthroughView()
		let rightLeg = UIImageView()
		let imgRightLeg = UIImage(named:"RightLeg.png", in: bundle, compatibleWith: nil)
		if imgRightLeg == nil {
			print("** Warning: Could not create image from 'RightLeg.png'")
		}
		rightLeg.image = imgRightLeg
		rightLeg.contentMode = .center
		rightLeg.layer.anchorPoint = CGPoint(x:0.049, y:0.073)
		rightLeg.bounds = CGRect(x:0, y:0, width:49.0, height:64.0)
		rightLeg__root.layer.position = CGPoint(x:208.675, y:413.528)
		rightLeg__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		rightLeg__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		rightLeg__root.transform = CGAffineTransform(rotationAngle: 0.000)
		rightLeg__root.addSubview(rightLeg__xScale)
		rightLeg__xScale.addSubview(rightLeg__yScale)
		rightLeg__yScale.addSubview(rightLeg)
		__scaling__.addSubview(rightLeg__root)
		viewsByName["RightLeg__root"] = rightLeg__root
		viewsByName["RightLeg__xScale"] = rightLeg__xScale
		viewsByName["RightLeg__yScale"] = rightLeg__yScale
		viewsByName["RightLeg"] = rightLeg

		let fooPls__root = _FOOPLSPassthroughView()
		let fooPls__xScale = _FOOPLSPassthroughView()
		let fooPls__yScale = _FOOPLSPassthroughView()
		let fooPls = UIImageView()
		let imgFooPls = UIImage(named:"FooPls.png", in: bundle, compatibleWith: nil)
		if imgFooPls == nil {
			print("** Warning: Could not create image from 'FooPls.png'")
		}
		fooPls.image = imgFooPls
		fooPls.contentMode = .center
		fooPls.bounds = CGRect(x:0, y:0, width:198.0, height:73.0)
		fooPls__root.layer.position = CGPoint(x:187.500, y:333.500)
		fooPls__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fooPls__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fooPls__root.transform = CGAffineTransform(rotationAngle: 0.000)
		fooPls__root.addSubview(fooPls__xScale)
		fooPls__xScale.addSubview(fooPls__yScale)
		fooPls__yScale.addSubview(fooPls)
		__scaling__.addSubview(fooPls__root)
		viewsByName["FooPls__root"] = fooPls__root
		viewsByName["FooPls__xScale"] = fooPls__xScale
		viewsByName["FooPls__yScale"] = fooPls__yScale
		viewsByName["FooPls"] = fooPls

		self.viewsByName = viewsByName
	}

	// - MARK: loadingAnimation
	func addLoadingAnimation() {
		addLoadingAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addLoadingAnimation(completion: ((Bool) -> Void)?) {
		addLoadingAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addLoadingAnimation(removedOnCompletion: Bool) {
		addLoadingAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addLoadingAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addLoadingAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addLoadingAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 3.000
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "LoadingAnimation")
			self.animationCompletions[layer.animation(forKey: "LoadingAnimation")!] = complete
		}

		let rightLegRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		rightLegRotationAnimation.duration = 3.000
		rightLegRotationAnimation.values = [-0.524, 2.019, -0.524, 1.905, -0.524, -0.524] as [Float]
		rightLegRotationAnimation.keyTimes = [0.000, 0.133, 0.250, 0.383, 0.500, 1.000] as [NSNumber]
		rightLegRotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		rightLegRotationAnimation.beginTime = beginTime
		rightLegRotationAnimation.fillMode = fillMode
		rightLegRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["RightLeg__root"]?.layer.add(rightLegRotationAnimation, forKey:"loadingAnimation_Rotation")

		let rightLegOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		rightLegOpacityAnimation.duration = 3.000
		rightLegOpacityAnimation.values = [1.000, 1.000, 0.000] as [Float]
		rightLegOpacityAnimation.keyTimes = [0.000, 0.750, 1.000] as [NSNumber]
		rightLegOpacityAnimation.timingFunctions = [linearTiming, linearTiming]
		rightLegOpacityAnimation.beginTime = beginTime
		rightLegOpacityAnimation.fillMode = fillMode
		rightLegOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["RightLeg__root"]?.layer.add(rightLegOpacityAnimation, forKey:"loadingAnimation_Opacity")

		let rightLegTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		rightLegTranslationXAnimation.duration = 3.000
		rightLegTranslationXAnimation.values = [-277.193, -77.513, -17.539, -21.193, -21.193] as [Float]
		rightLegTranslationXAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		rightLegTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		rightLegTranslationXAnimation.beginTime = beginTime
		rightLegTranslationXAnimation.fillMode = fillMode
		rightLegTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["RightLeg__root"]?.layer.add(rightLegTranslationXAnimation, forKey:"loadingAnimation_TranslationX")

		let rightLegTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		rightLegTranslationYAnimation.duration = 3.000
		rightLegTranslationYAnimation.values = [-163.380, -163.380, -163.380, -164.380, -164.380] as [Float]
		rightLegTranslationYAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		rightLegTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		rightLegTranslationYAnimation.beginTime = beginTime
		rightLegTranslationYAnimation.fillMode = fillMode
		rightLegTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["RightLeg__root"]?.layer.add(rightLegTranslationYAnimation, forKey:"loadingAnimation_TranslationY")

		let fooPlsOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		fooPlsOpacityAnimation.duration = 3.000
		fooPlsOpacityAnimation.values = [0.000, 0.000, 0.000, 1.000, 1.000, 0.000] as [Float]
		fooPlsOpacityAnimation.keyTimes = [0.000, 0.499, 0.500, 0.583, 0.750, 1.000] as [NSNumber]
		fooPlsOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		fooPlsOpacityAnimation.beginTime = beginTime
		fooPlsOpacityAnimation.fillMode = fillMode
		fooPlsOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["FooPls__root"]?.layer.add(fooPlsOpacityAnimation, forKey:"loadingAnimation_Opacity")

		let fooPlsScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		fooPlsScaleXAnimation.duration = 3.000
		fooPlsScaleXAnimation.values = [1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000] as [Float]
		fooPlsScaleXAnimation.keyTimes = [0.000, 0.583, 0.633, 0.667, 0.717, 0.750, 1.000] as [NSNumber]
		fooPlsScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		fooPlsScaleXAnimation.beginTime = beginTime
		fooPlsScaleXAnimation.fillMode = fillMode
		fooPlsScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["FooPls__xScale"]?.layer.add(fooPlsScaleXAnimation, forKey:"loadingAnimation_ScaleX")

		let fooPlsScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		fooPlsScaleYAnimation.duration = 3.000
		fooPlsScaleYAnimation.values = [1.000, 1.000, 0.900, 1.000, 0.900, 1.000, 1.000] as [Float]
		fooPlsScaleYAnimation.keyTimes = [0.000, 0.583, 0.633, 0.667, 0.717, 0.750, 1.000] as [NSNumber]
		fooPlsScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		fooPlsScaleYAnimation.beginTime = beginTime
		fooPlsScaleYAnimation.fillMode = fillMode
		fooPlsScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["FooPls__yScale"]?.layer.add(fooPlsScaleYAnimation, forKey:"loadingAnimation_ScaleY")

		let fooPlsTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fooPlsTranslationXAnimation.duration = 3.000
		fooPlsTranslationXAnimation.values = [-0.385, 0.245, 0.708, 0.708] as [Float]
		fooPlsTranslationXAnimation.keyTimes = [0.000, 0.583, 0.750, 1.000] as [NSNumber]
		fooPlsTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fooPlsTranslationXAnimation.beginTime = beginTime
		fooPlsTranslationXAnimation.fillMode = fillMode
		fooPlsTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["FooPls__root"]?.layer.add(fooPlsTranslationXAnimation, forKey:"loadingAnimation_TranslationX")

		let fooPlsTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fooPlsTranslationYAnimation.duration = 3.000
		fooPlsTranslationYAnimation.values = [40.000, 40.000, 40.000] as [Float]
		fooPlsTranslationYAnimation.keyTimes = [0.000, 0.583, 1.000] as [NSNumber]
		fooPlsTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		fooPlsTranslationYAnimation.beginTime = beginTime
		fooPlsTranslationYAnimation.fillMode = fillMode
		fooPlsTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["FooPls__root"]?.layer.add(fooPlsTranslationYAnimation, forKey:"loadingAnimation_TranslationY")

		let leftLegRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		leftLegRotationAnimation.duration = 3.000
		leftLegRotationAnimation.values = [6.492, 3.836, 6.492, 3.964, 6.492, 6.492] as [Float]
		leftLegRotationAnimation.keyTimes = [0.000, 0.133, 0.250, 0.383, 0.500, 1.000] as [NSNumber]
		leftLegRotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		leftLegRotationAnimation.beginTime = beginTime
		leftLegRotationAnimation.fillMode = fillMode
		leftLegRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["LeftLeg__root"]?.layer.add(leftLegRotationAnimation, forKey:"loadingAnimation_Rotation")

		let leftLegOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		leftLegOpacityAnimation.duration = 3.000
		leftLegOpacityAnimation.values = [1.000, 1.000, 0.000] as [Float]
		leftLegOpacityAnimation.keyTimes = [0.000, 0.750, 1.000] as [NSNumber]
		leftLegOpacityAnimation.timingFunctions = [linearTiming, linearTiming]
		leftLegOpacityAnimation.beginTime = beginTime
		leftLegOpacityAnimation.fillMode = fillMode
		leftLegOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["LeftLeg__root"]?.layer.add(leftLegOpacityAnimation, forKey:"loadingAnimation_Opacity")

		let leftLegTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		leftLegTranslationXAnimation.duration = 3.000
		leftLegTranslationXAnimation.values = [-223.781, -24.101, 35.872, 32.219, 32.219] as [Float]
		leftLegTranslationXAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		leftLegTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		leftLegTranslationXAnimation.beginTime = beginTime
		leftLegTranslationXAnimation.fillMode = fillMode
		leftLegTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["LeftLeg__root"]?.layer.add(leftLegTranslationXAnimation, forKey:"loadingAnimation_TranslationX")

		let leftLegTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		leftLegTranslationYAnimation.duration = 3.000
		leftLegTranslationYAnimation.values = [-165.203, -165.203, -165.203, -166.203, -166.203] as [Float]
		leftLegTranslationYAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		leftLegTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		leftLegTranslationYAnimation.beginTime = beginTime
		leftLegTranslationYAnimation.fillMode = fillMode
		leftLegTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["LeftLeg__root"]?.layer.add(leftLegTranslationYAnimation, forKey:"loadingAnimation_TranslationY")

		let group3RotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		group3RotationAnimation.duration = 3.000
		group3RotationAnimation.values = [0.000, 0.000, 0.000, 0.000] as [Float]
		group3RotationAnimation.keyTimes = [0.000, 0.250, 0.500, 1.000] as [NSNumber]
		group3RotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		group3RotationAnimation.beginTime = beginTime
		group3RotationAnimation.fillMode = fillMode
		group3RotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Group 3__root"]?.layer.add(group3RotationAnimation, forKey:"loadingAnimation_Rotation")

		let group3OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		group3OpacityAnimation.duration = 3.000
		group3OpacityAnimation.values = [1.000, 1.000, 0.000] as [Float]
		group3OpacityAnimation.keyTimes = [0.000, 0.750, 1.000] as [NSNumber]
		group3OpacityAnimation.timingFunctions = [linearTiming, linearTiming]
		group3OpacityAnimation.beginTime = beginTime
		group3OpacityAnimation.fillMode = fillMode
		group3OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Group 3__root"]?.layer.add(group3OpacityAnimation, forKey:"loadingAnimation_Opacity")

		let group3TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		group3TranslationXAnimation.duration = 3.000
		group3TranslationXAnimation.values = [-255.999, -56.319, 3.655, 0.001, 0.001] as [Float]
		group3TranslationXAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		group3TranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		group3TranslationXAnimation.beginTime = beginTime
		group3TranslationXAnimation.fillMode = fillMode
		group3TranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Group 3__root"]?.layer.add(group3TranslationXAnimation, forKey:"loadingAnimation_TranslationX")

		let group3TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		group3TranslationYAnimation.duration = 3.000
		group3TranslationYAnimation.values = [-129.754, -129.754, -129.754, -130.754, -130.754] as [Float]
		group3TranslationYAnimation.keyTimes = [0.000, 0.384, 0.499, 0.500, 1.000] as [NSNumber]
		group3TranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		group3TranslationYAnimation.beginTime = beginTime
		group3TranslationYAnimation.fillMode = fillMode
		group3TranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Group 3__root"]?.layer.add(group3TranslationYAnimation, forKey:"loadingAnimation_TranslationY")
	}

	func removeLoadingAnimation() {
		self.layer.removeAnimation(forKey: "LoadingAnimation")
		self.viewsByName["RightLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Rotation")
		self.viewsByName["RightLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Opacity")
		self.viewsByName["RightLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationX")
		self.viewsByName["RightLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationY")
		self.viewsByName["FooPls__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Opacity")
		self.viewsByName["FooPls__xScale"]?.layer.removeAnimation(forKey: "loadingAnimation_ScaleX")
		self.viewsByName["FooPls__yScale"]?.layer.removeAnimation(forKey: "loadingAnimation_ScaleY")
		self.viewsByName["FooPls__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationX")
		self.viewsByName["FooPls__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationY")
		self.viewsByName["LeftLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Rotation")
		self.viewsByName["LeftLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Opacity")
		self.viewsByName["LeftLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationX")
		self.viewsByName["LeftLeg__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationY")
		self.viewsByName["Group 3__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Rotation")
		self.viewsByName["Group 3__root"]?.layer.removeAnimation(forKey: "loadingAnimation_Opacity")
		self.viewsByName["Group 3__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationX")
		self.viewsByName["Group 3__root"]?.layer.removeAnimation(forKey: "loadingAnimation_TranslationY")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "LoadingAnimation")
	}
}

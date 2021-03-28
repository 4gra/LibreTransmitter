//
//  LibreTransmitterManager+UI.swift
//  Loop
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopKit
import LoopKitUI
import HealthKit
import LibreTransmitter

extension LibreTransmitterManager: CGMManagerUI {
    public static func setupViewController(bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> SetupUIResult<UIViewController & CGMManagerCreateNotifying & CGMManagerOnboardNotifying & CompletionNotifying, CGMManagerUI> {
        return .createdAndOnboarded(LibreTransmitterManager())
        // TODO: need to LibreTransmitterSetupViewController()
    }
    
    //public func settingsViewController(for glucoseUnit: HKUnit, glucoseTintColor: Color, guidanceColors: GuidanceColors) -> (UIViewController & CompletionNotifying) {
    public func settingsViewController(for displayGlucoseUnitObservable: DisplayGlucoseUnitObservable, bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> (UIViewController & CGMManagerOnboardNotifying & CompletionNotifying) {
        let settings = LibreTransmitterSettingsViewController(cgmManager: self, displayGlucoseUnitObservable: displayGlucoseUnitObservable, allowsDeletion: true)
        let nav = CGMManagerSettingsNavigationViewController(rootViewController: settings)
        return nav
    }
    
    public var cgmStatusBadge: DeviceStatusBadge? {
        nil
    }
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmStatusHighlight: DeviceStatusHighlight? {
        nil
    }
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmLifecycleProgress: DeviceLifecycleProgress? {
        nil
    }
}

extension LibreTransmitterManager: DeviceManagerUI {
    public var smallImage: UIImage? {
       self.getSmallImage()
    }
}

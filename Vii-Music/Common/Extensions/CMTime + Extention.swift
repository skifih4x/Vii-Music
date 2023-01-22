//
//  CMTime + Extention.swift
//  Vii-Music
//
//  Created by Артем Орлов on 22.01.2023.
//

import Foundation
import AVKit

extension CMTime {
    
    var durationText:String {
        let totalSeconds = CMTimeGetSeconds(self)
        let hours:Int = Int(totalSeconds / 3600)
        let minutes:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))

        if hours > 0 {
            return String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            return String(format: "%02i:%02i", minutes, seconds)
        }
    }

    func toDisplayString () -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totatSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totatSeconds % 60
        let minutes = totatSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}

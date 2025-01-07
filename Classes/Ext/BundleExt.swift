import Foundation

extension Bundle {
    var associatedDomains: [String] {
        guard let entitlements = self.infoDictionary?["com.apple.developer.associated-domains"] as? [String] else {
            return []
        }
        return entitlements
    }
}


extension Bundle {
    var appName: String? {
        return self.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String 
            ?? self.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}




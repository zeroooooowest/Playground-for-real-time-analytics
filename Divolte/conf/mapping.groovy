mapping {
    map duplicate() onto 'detectedDuplicate'
    map corrupt() onto 'detectedCorruption'
    map firstInSession() onto 'firstInSession'
    map timestamp() onto 'timestamp'
    map clientTimestamp() onto 'clientTimestamp'
    map remoteHost() onto 'remoteHost'
    map referer() onto 'referer'
    map location() onto 'location'
    map viewportPixelWidth() onto 'viewportPixelWidth'
    map viewportPixelHeight() onto 'viewportPixelHeight'
    map screenPixelWidth() onto 'screenPixelWidth'
    map screenPixelHeight() onto 'screenPixelHeight'
    map partyId() onto 'partyId'
    map sessionId() onto 'sessionId'
    map pageViewId() onto 'pageViewId'
    map eventType() onto 'eventType'

    map userAgentString() onto 'userAgentString'
    def ua = userAgent()
    map ua.name() onto 'userAgentName'
    map ua.family() onto 'userAgentFamily'
    map ua.vendor() onto 'userAgentVendor'
    map ua.type() onto 'userAgentType'
    map ua.version() onto 'userAgentVersion'
    map ua.deviceCategory() onto 'userAgentDeviceCategory'
    map ua.osFamily() onto 'userAgentOsFamily'
    map ua.osVersion() onto 'userAgentOsVersion'
    map ua.osVendor() onto 'userAgentOsVendor'

    map eventParameter('technology') onto 'technology'


    // uses the remoteHost as IP address to lookup
    //def ua = ip2geo()
    map ip2geo().cityId() onto 'cityId'
    map ip2geo().cityName() onto 'cityName'
    map ip2geo().continentCode() onto 'continentCode'
    map ip2geo().continentId() onto 'continentId'
    map ip2geo().continentName() onto 'continentName'
    map ip2geo().countryCode() onto 'countryCode'
    map ip2geo().countryId() onto 'countryId'
    map ip2geo().countryName() onto 'countryName'
    map ip2geo().latitude() onto 'latitude'
    map ip2geo().longitude() onto 'longitude'
    map ip2geo().metroCode() onto 'metroCode'
    map ip2geo().timeZone() onto 'timeZone'
    map ip2geo().mostSpecificSubdivisionCode() onto 'mostSpecificSubdivisionCode'
    map ip2geo().mostSpecificSubdivisionId() onto 'mostSpecificSubdivisionId'
    map ip2geo().mostSpecificSubdivisionName() onto 'mostSpecificSubdivisionName'
    map ip2geo().postalCode() onto 'postalCode'
    //map ip2geo().subdivisionCodes() onto 'subdivisionCodes'
    //map ip2geo().subdivisionIds() onto 'subdivisionIds'
    // ip2geo().subdivisionNames() onto 'subdivisionNames'

    // If a load balancer sets custom headers for IP addresses, use like this
    //def ip = header('X-Custom-Header').first()
    //def myUa = ip2geo(ip)
}

import Regenerate

public typealias Ditto = Array256

public extension Ditto {
    func save(newValue: Element) -> Self? {
        let key = length
        let value = newValue
        
        guard let unwrappedKey = key else { return nil }
        
        let newChildren = children.setting(key: unwrappedKey.toString(), value: value)
        guard let newCore = core.setting(key: unwrappedKey, to: value.empty()) else { return nil }
        return changing(core: newCore, children: newChildren, length: length.advanced(by: 1))
    }
    
    // Saves a new version of specified input parameter
    func save(newValue: Element.Artifact) -> Self? {
        guard let address = Element(artifact: newValue, complete: true) else { return nil }
        return save(newValue: address)
    }
    
    // Retreives version rolled back "previous" times
    func get(_ previous: Int = 0) -> Element? {
        return get(previous: Index(previous))
    }
    
    func get(previous: Index) -> Element? {
        if previous < 0 || previous >= length { return nil }
        let key = length - previous - 1
        return children[key.toString()]
    }
}

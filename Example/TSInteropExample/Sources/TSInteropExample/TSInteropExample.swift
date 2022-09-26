@main
public struct TSInteropExample {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(TSInteropExample().text)
    }
}

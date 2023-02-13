import Cocoa

func sameLetterStrings(str1: String, str2: String) -> Bool {
    return str1.sorted() == str2.sorted()
}

sameLetterStrings(str1: "abc", str2: "cba")

func pythag(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
pythag(a:3, b:4)

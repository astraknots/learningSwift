import Cocoa

/* The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
 
 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
 As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.
 */

enum IntSqrtErrors: Error {
    case outOfBounds, noRoot
}

func intSqrt(for inum:Int) throws -> Int {
    if inum < 1 || inum > 10_000 {
        throw IntSqrtErrors.outOfBounds
    }
    for i in 1...inum {
        if i*i == inum {
            return i
        }
    }
    throw IntSqrtErrors.noRoot
}

for x in -1...10_001 {
    do {
        var isqrt = try intSqrt(for: x)
        print("The sqrt of \(x) is \(isqrt)")
    }
    catch IntSqrtErrors.outOfBounds {
        print("Int number was out of bounds. Valid values are 1-10,000")
    }
    catch IntSqrtErrors.noRoot {
        print("Can't find an integer sqrt for number")
    }
    catch {
        print("An error occurred.")
    }
}

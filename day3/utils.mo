import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";
import List "mo:base/List";

actor Utils {
    // 1. In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    // second_maximum(array : [Int]) ->  Int;

    public func second_maximum(array : [Int]) : async Int {
        let newArray = Array.sort(array, Int.compare);
        let reverseArray = Array.reverse(newArray);

        return reverseArray[1];
    };

    // 2. In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
    // remove_even(array : [Nat]) -> [Nat];

    public func remove_even(array : [Nat]) : async [Nat] {
        return Array.filter<Nat>(array, func x = x % 2 != 0);
    };

    // 3. In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    // ⛔️ Do not use a loop.
    // drop<T> : (xs : [T], n : Nat) -> [T]

    func drop<T>(array : [T], n : Nat) : [T] {
        var newArray = List.fromArray(array);
        var dropE = List.drop(newArray, n);
        return List.toArray<T>(dropE);
    };

};

import Array "mo:base/Array";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";

actor {

    // 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
    //average_array(array : [Int]) -> async Int.

    public func avarage_array(array : [Int]) : async Int {
        // The var sum can be outside but since we want to run the function every time I think to reset the value like this to make some tests
        var sum : Int = 0;
        let arraySize = array.size();
        for (element in array.vals()) {
            sum := sum + element;
        };
        return sum / arraySize;
    };

    // 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
    //count_character(t : Text, c : Char) -> async Nat

    // <----- For me didn't make sence to pass a char, since the func takes the char has a number and how the user will know which number representated the letter, so the commun sense tell me to expect a character of a Text and compare it with the letters of the string and return the number of occurrences in the string. ------>

    public func character_count(t : Text, c : Text) : async Nat {
        var count : Nat = 0;

        for (w in Text.toIter(t)) {
            if (Char.toText(w) == c) {
                count := count +1;
            };
        };
        return count;
    };

    // 3. Write a function factorial that takes a natural number n and returns the factorial of n.
    //factorial(n : Nat) -> async Nat

    public query func factorial(n : Nat) : async Nat {
        func loopFac(m : Nat) : Nat {
            if (m == 0) {
                return 1;
            } else {
                return m * loopFac(m - 1);
            };
        };
        return loopFac(n);
    };

    // 4. Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
    //number_of_words(t : Text) -> async Nat
    public func number_of_words(t : Text) : async Nat {
        var count = 1;
        for (x in Text.toIter(t)) {
            if (Char.toText(x) == " ") {
                count := count + 1;
            };
        };
        return count;
    };

    // 5. Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
    //find_duplicates(a : [Nat]) -> async [Nat]

    public func find_duplicates(a : [Nat]) : async [Nat] {
        let bufferSize = Buffer.Buffer<Nat>(3);
        let buffer = Buffer.Buffer<Nat>(3);
        var count = 0;

        for (x in a.vals()) {
            bufferSize.add(x);
        };

        while (count < bufferSize.size()) {
            count := count + 1;
            if (bufferSize.get(count +1) == bufferSize.get(count)) {
                buffer.add(bufferSize.get(count));
            };
        };

        return Buffer.toArray(buffer);
    };

    // 6. Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
    //convert_to_binary(n : Nat) -> async Text;
    public query func convert_to_binary(n : Nat) : async Text {
        var num = n;
        var binary = Nat.toText((num % 2));
        while (num > 1) {
            num := Int.abs((num / 2));
            binary := Nat.toText(num % 2) # binary;
        };
        return binary;
    };
};

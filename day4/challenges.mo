import List "mo:base/Array";
import Buffer "mo:base/Buffer";

actor {
    // 1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    //unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T>

    public func unique<T>(l : List.List<T>) : async List.List<T> {
        var newList : List.List<T> = List.List.nil<T>();

        for (x in List.toIter<T>(l)) {
            if (not List.some<T>(list, func a = a == i)) {
                newList := List.push<T>(x, newList);
            };
        };
        return newList;
    };

    // 2. Write a function reverse that takes l of type List and returns the reversed list.
    //reverse<T> : (l : List<T>) -> List<T>;

    public func reverse<T>(l : List<T>) : async List<T> {
        return List.reverse<T>(l);
    };

    // 3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    //is_anynomous : () -> async Bool;

    public query ({ caller }) func is_anon() : async Bool {
        Principal.isAnonymous(caller);
    };

    // 4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    //find_in_buffer<T> : (buf : Buffer.Buffer<T>, val : T, equal : (T, T) -> Bool) -> ?Nat

    public func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T) : async ?Nat {
        return Buffer.indexOf<T>(val, buf, func a { a == val });
    };

    // 5. Take a look at the code we've seen before in this guide:

    import HashMap "mo:base/HashMap";
    import Iter "mo:base/Iter";
    import Principal "mo:base/Principal";
    actor {

        let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

        public shared ({ caller }) func add_username(name : Text) : async () {
            usernames.put(caller, name);
        };
    };

    // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    //get_usernames : () -> async [(Principal, Text)];

    public query func get_usernames() : async [(Principal, Text)] {
        Iter.toArray(username.entries());
    };
};

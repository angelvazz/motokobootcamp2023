1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

### R: No, the heap memory wont be saved when upgrading a canister. 4GB of heap memory in the canister.

2. How much accounts can a unique Principal own?

### R: A Principal can control unlimited number of Accounts.

3. Can we safely upgrade a canister from interface A to interface B?

### R: Yes.

Interfaz A

```
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```

Interface B

```
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}
```

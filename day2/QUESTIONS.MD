1. Who controls the ledger canister?

   ### R: Any one can interact with the ledger, since is a record of every transaction, but control of the ledger perse like alter the records of the ledger no one can, but to add more features to the ledger, anyone who has the identity of the canister and the code.

2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?

   ### R: That id is for the Motoko PlayGround that's the subnet (the app as a manner of speaking) and the nodes are 1,300.

3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?

   ### R: Voting power of 4 years = 1.25X

4. What is wrong with the following code?

   ### R: You need to import Nat from the library of motoko import Nat "mo:base/Nat"

```
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };

}
```

5. What is wrong with the following code?

   ### R: You need to remore the var from the [var Text], the var by itself they have a shared type, but when you added to the types they become a non shared type. So is enough to declare the var and add the type without the var. If you want to add var to a type you need to declare the type first.

```
actor {
var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

public func show_languages(language : Text) : async [var Text] {
return (languages);
};

}
```

6. What is wrong with the following code?

```
actor {
var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

public func add_language(new_language: Text) : async [Text] {
languages := Array.append<Text>(languages, [new_language]);
return (languages);
};

}
```

### R: First; You need to import Array from the library of motoko, Second; this will cause a warning that Array.append its deprecated, so you need to convert the array in a buffer, then put the array in a for in and add the elements to the buffer and then you can add the new_language and finally you convert the Buffer to an Array.

```
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";

actor {

  var languages : [Text] = [
    "English",
    "German",
    "Chinese",
    "Japanese",
    "French",
  ];

  public func add_language(new_language : Text) : async [Text] {

    let arrayBuffer = Buffer.Buffer<Text>(languages.size());

    for (x in languages.vals()) {
      arrayBuffer.add(x);
    };

    arrayBuffer.add(new_language);

    return Buffer.toArray(arrayBuffer);
  };

};
```

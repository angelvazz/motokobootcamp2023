1. How much is the current memory capacity of a canister?

   ### R: The current memory capacity today is 48gb.

2. What is the issue with the following code sample?
   ### R: You can't mutate a let, you need to change it like this: `var counter : Nat = 0;`

```
actor {
let counter : Nat = 0;
public func increment_counter() : async () {
counter := counter + 1;
};
}
```

3. What is the issue with the following code sample?
   ### R: In the var message you can't declare the type like Text and put a Nat.

```

actor {
var message : Text = 0;

public query func change_message(new_message : Text) : async () {
message := new_message;
return;
};

public query func see_message() : async Text {
return(message);
};
}
```

4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
   ### R: False.

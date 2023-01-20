import Types "book";
import List "mo:base/List";

actor Store {

    // 6. In main.mo import the type List from the Base Library and create a list that stores books.

    stable var storedBook : List.List<Types.Book> = List.nil<Types.Book>();

    // 7. In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list. Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.

    public func add_book(titleText : Text, pagesNum : Nat) {
        let newBook : Types.Book = {
            title = titleText;
            pages = pagesNum;
        };

        storedBook := List.push(newBook, storedBook);

    };

    public query func get_books() : async [Types.Book] {
        return List.toArray(storedBook);
    };
};

import QtQuick 2.0
import QtQuick.LocalStorage 2.0

QtObject {
    property var db;
    function createBooksTable() {
        db.transaction(function (tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS books (
                id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT NOT NULL,
                title TEXT NOT NULL, tp INTEGER NOT NULL);");});
    }

    function insertBook(author, title, tp) {
        db.transaction(function (tx) {
            tx.executeSql("INSERT INTO books (author, title, tp)
                                              VALUES(?, ?, ?);",
                          [author, title, tp]);
        });
    }
    function retrieveBooks(callback) {
        db.readTransaction(function (tx) {
            var result = tx.executeSql("SELECT * FROM books;");
            callback(result.rows);
        });
    }

    function deleteBook(id) {
        db.transaction(function (tx) {
            tx.executeSql("DELETE FROM books WHERE id = ?;", [id]);
        });
    }

    function deleteBooks() {
        db.transaction(function (tx) {
            tx.executeSql("DELETE FROM books;");
            tx.executeSql("DELETE FROM SQLITE_SEQUENCE WHERE name='books';");
        });
    }

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("books", "1.0");
        createBooksTable();
    }
}

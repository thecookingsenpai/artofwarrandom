import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TheArtOfWarRandomQuotesFirebaseUser {
  TheArtOfWarRandomQuotesFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TheArtOfWarRandomQuotesFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TheArtOfWarRandomQuotesFirebaseUser>
    theArtOfWarRandomQuotesFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TheArtOfWarRandomQuotesFirebaseUser>(
            (user) => currentUser = TheArtOfWarRandomQuotesFirebaseUser(user));

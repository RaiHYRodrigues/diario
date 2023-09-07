import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, GoogleAuthProvider;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_exceptions.dart';
import 'auth_user.dart';

class FirebaseAuthProvider {
  Future<void> initialize() async {
    if (kIsWeb) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
        apiKey: 'AIzaSyD9CyZ8KdjD9SmeE3BCN8qWCQpWc1IKVcA',
        appId: '1:279935568439:web:49ba99bd6669c51ebd8db2',
        messagingSenderId: '279935568439',
        projectId: 'diario-de-campo-f67ef',
        authDomain: 'diario-de-campo-f67ef.firebaseapp.com',
        storageBucket: 'diario-de-campo-f67ef.appspot.com',
        
      ));
    } else {
      await Firebase.initializeApp();
    }
  }

  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  Future<AuthUser> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    final user = currentUser;
    if (user != null) {
      return user;
    } else {
      throw GoogleSignInAuthException();
    }
  }
}

Future<void> logOut() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseAuth.instance.signOut();
  } else {
    throw UserNotLoggedInAuthException();
  }
}

Future<void> sendEmailVerification() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.sendEmailVerification();
  } else {
    throw UserNotLoggedInAuthException();
  }
}

Future<void> sendPasswordReset({required String toEmail}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: toEmail);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'firebase_auth/invalid-email':
        throw InvalidEmailAuthException();
      case 'firebase_auth/user-not-found':
        throw UserNotFoundAuthException();
      default:
        throw GenericAuthException();
    }
  } catch (_) {
    throw GenericAuthException();
  }
}

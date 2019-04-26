import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateUserInfo(String uid, DateTime dueDate) {
  DocumentReference userReference =
      Firestore.instance.collection('users').document(uid);

  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(userReference);
    if (postSnapshot.exists) {
      // Extend 'dueDate' if the list does not contain the recipe ID:
        await tx.update(userReference, <String, dynamic>{
          'dueDate': dueDate,
        });
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'dueDate' to the document:
      await tx.set(userReference, {
        'dueDate': dueDate,
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}
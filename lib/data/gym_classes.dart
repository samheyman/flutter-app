import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateSavedClasses(String uid, String classId) {
  DocumentReference savedClassesReference =
      Firestore.instance.collection('users').document(uid);

  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(savedClassesReference);
    if (postSnapshot.exists) {
      // Extend 'savedClasses' if the list does not contain the recipe ID:
      if (!postSnapshot.data['savedClasses'].contains(classId)) {
        await tx.update(savedClassesReference, <String, dynamic>{
          'savedClasses': FieldValue.arrayUnion([classId])
        });
      // Delete the recipe ID from 'savedClasses':
      } else {
        await tx.update(savedClassesReference, <String, dynamic>{
          'savedClasses': FieldValue.arrayRemove([classId])
        });
      }
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'savedClasses' to the document:
      await tx.set(savedClassesReference, {
        'savedClasses': [classId]
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}
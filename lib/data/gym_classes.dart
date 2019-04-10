import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateSavedClasses(String uid, String classId) {
  DocumentReference savedClassesReference =
      Firestore.instance.collection('users').document(uid);

  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(savedClassesReference);
    if (postSnapshot.exists) {
      // Extend 'favorites' if the list does not contain the recipe ID:
      if (!postSnapshot.data['saved_classes'].contains(classId)) {
        await tx.update(savedClassesReference, <String, dynamic>{
          'saved_classes': FieldValue.arrayUnion([classId])
        });
      // Delete the recipe ID from 'favorites':
      } else {
        await tx.update(savedClassesReference, <String, dynamic>{
          'saved_classes': FieldValue.arrayRemove([classId])
        });
      }
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'favorites' to the document:
      await tx.set(savedClassesReference, {
        'saved_classes': [classId]
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}

List<String> getSavedClassesIds() {
  return [
    '0',
    '2',
    '3',
  ];
}
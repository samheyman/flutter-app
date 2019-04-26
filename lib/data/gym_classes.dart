import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateBookedClasses(String uid, String classId) {
  DocumentReference bookedClassesReference =
      Firestore.instance.collection('users').document(uid);
  
  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(bookedClassesReference);
    if (postSnapshot.exists && postSnapshot.data.containsKey('bookedClasses')) {
      // Create the key if it isn't there
      // if (!postSnapshot.data.containsKey('bookedClasses')) {
      //   await tx.set(bookedClassesReference, {
      //     'bookedClasses': []
      //   });
      // }
      // Extend 'bookedClasses' if the list does not contain the recipe ID:
      if (!postSnapshot.data['bookedClasses'].contains(classId)) {
        await tx.update(bookedClassesReference, <String, dynamic>{
          'bookedClasses': FieldValue.arrayUnion([classId])
        });
      // Delete the recipe ID from 'bookedClasses':
      } else {
        await tx.update(bookedClassesReference, <String, dynamic>{
          'bookedClasses': FieldValue.arrayRemove([classId])
        });
      }
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'bookedClasses' to the document:
      print("No saved class entry for user, creating one now to save class " + classId);
      
      await tx.set(bookedClassesReference, {
        'bookedClasses': [classId]
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}
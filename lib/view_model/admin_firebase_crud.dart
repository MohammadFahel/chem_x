import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/response_firebase_element.dart';



final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('admin_CRUD_operations');



class FirebaseCrud {

  // ADD:
  static Future<Response> addElement({
    required elementCategory,
    required elementQuestion,
    required elementsCorrectAnswer,
    required elementAnswerTwo,
    required elementAnswerThree,
    required elementAnswerFour
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();



    Map<String, dynamic> data = <String, dynamic>{
      "element_id": documentReferencer.id,
      "element_category": elementCategory,
      "element_question" : elementQuestion,
      "element_correct_answer": elementsCorrectAnswer,
      "element_answer_two": elementAnswerTwo,
      "element_answer_three": elementAnswerThree,
      "element_answer_four": elementAnswerFour
    };
    var result = await documentReferencer
        .set(data)
        .whenComplete(() {

      response.code = 200;
      response.message = "Successfully Added To The Database";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;

  }

  // READ
  static Stream<QuerySnapshot> readElement() {
    CollectionReference notesItemCollection =
        _Collection;
    return notesItemCollection.snapshots();
  }

  // UPDATE:
  static Future<Response> updateElement({
    required elementID,
    required elementCategory,
    required elementQuestion,
    required elementsCorrectAnswer,
    required elementAnswerTwo,
    required elementAnswerThree,
    required elementAnswerFour
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(elementID);
    Map<String, dynamic> data = <String, dynamic>{
      "element_category": elementCategory,
      "element_question" : elementQuestion,
      "element_correct_answer": elementsCorrectAnswer,
      "element_answer_two": elementAnswerTwo,
      "element_answer_three": elementAnswerThree,
      "element_answer_four": elementAnswerFour
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully Updated The Quiz";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }

  // DELETE:
  static Future<Response> deleteElement({
    required String elementId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(elementId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Successfully Deleted The Quiz";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }
}


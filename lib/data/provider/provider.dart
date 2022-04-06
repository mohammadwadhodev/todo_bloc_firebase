import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc_firebase/data/module/student_data_model.dart';
import 'package:uuid/uuid.dart';
class ApiProvider{
  CollectionReference<Map<String,dynamic>> students = FirebaseFirestore.instance.collection('students');

  Future<void> addDataFireStore(name, roll)async{

    String userDocId = '';
    var id =  Uuid();
    var uuId = id.v1();
    StudentDataModel studentDataModel = StudentDataModel(
        id: uuId,
        name: name,
        roll: roll
    );
     await students.doc(uuId).set(studentDataModel.toJson());
  }

  Future<List<StudentDataModel>> getDataFromFireStore()async{
    List<StudentDataModel> allStudents = [];
   QuerySnapshot<Map<String,dynamic>> result =  await students.get();
   for(var res in result.docs){
     allStudents.add(StudentDataModel.fromJson(res.data()));
   }
   return allStudents;
  }

  Future<void> deleteUserFromFireStore(String id)async {

    return await students.doc(id).delete();
  }

}
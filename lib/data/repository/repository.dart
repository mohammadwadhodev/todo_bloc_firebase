import 'package:todo_bloc_firebase/data/module/student_data_model.dart';
import 'package:todo_bloc_firebase/data/provider/provider.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future<void> addDataRepo(name, roll)async {
    return await apiProvider.addDataFireStore(name, roll);
  }

  Future<List<StudentDataModel>> getDataRepo() {
    return apiProvider.getDataFromFireStore();
  }

  Future<void>deleteUser(String id) async{
    apiProvider.deleteUserFromFireStore(id);
  }
}
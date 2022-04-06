import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_firebase/bloc/add_bloc/add_data_cubit.dart';
import 'package:todo_bloc_firebase/data/module/student_data_model.dart';
import 'package:todo_bloc_firebase/data/repository/repository.dart';

part 'view_data_state.dart';

class ViewDataCubit extends Cubit<ViewDataState> {
  final repository = Repository();
  List<StudentDataModel> allStudents = [];
  ViewDataCubit() : super(ViewDataInitial()){
    getData();
  }

  void getData()async{
    print('getting data...');
    emit(ViewDataLoadingState());
    allStudents = await repository.getDataRepo();
    emit(DataRetrievedState());
  }

  void deleteUser(String id)async {
    print('user deleting...');
    emit(DeletingUserState());
    await repository.deleteUser(id);
    emit(UserDeletedState());
  }
}

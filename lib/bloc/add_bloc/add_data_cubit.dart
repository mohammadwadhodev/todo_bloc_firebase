import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc_firebase/data/repository/repository.dart';

part 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AddDataInitial());
  final repository = Repository();

  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();

  void addData(name,roll)async {
    emit(LoadingState());
    await repository.addDataRepo(name,roll);
    emit(DataAddedState());
  }

}

part of 'add_data_cubit.dart';

@immutable
abstract class AddDataState {}

class AddDataInitial extends AddDataState {}
class LoadingState extends AddDataState{}
class ErrorState extends AddDataState{}
class DataAddedState extends AddDataState{}

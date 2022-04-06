part of 'view_data_cubit.dart';

@immutable
abstract class ViewDataState {}

class ViewDataInitial extends ViewDataState {}
class ViewDataLoadingState extends ViewDataState{}
class ErrorState extends ViewDataState{}
class DataRetrievedState extends ViewDataState{}
class DeletingUserState extends ViewDataState{}
class UserDeletedState extends ViewDataState{}
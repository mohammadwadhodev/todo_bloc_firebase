import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_firebase/bloc/add_bloc/add_data_cubit.dart';
import 'package:todo_bloc_firebase/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/view_bloc/view_data_cubit.dart';
import 'constants/constants.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context)=>ViewDataCubit()),
            BlocProvider(
                create: (BuildContext context)=>AddDataCubit()),
          ],
          child: const MaterialApp(
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: kAddData,
          ))
  );
}


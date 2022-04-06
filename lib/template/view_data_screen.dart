import 'package:flutter/material.dart';
import 'package:todo_bloc_firebase/bloc/add_bloc/add_data_cubit.dart';
import 'package:todo_bloc_firebase/bloc/view_bloc/view_data_cubit.dart';
import 'package:todo_bloc_firebase/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewDataScreen extends StatefulWidget {
  const ViewDataScreen({Key? key}) : super(key: key);

  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<ViewDataCubit>(context);
    controller.getData();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade300,
          title: const Center(
              child: Text('All Students')
          ),
        ),

        body: BlocBuilder<ViewDataCubit, ViewDataState>(
          builder: (context, state) {
            return state is ViewDataLoadingState ? pleaseWait() :
            controller.allStudents.isNotEmpty ? ListView.builder(
              itemCount: controller.allStudents.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(controller.allStudents[index].name),
                        subtitle: Text(controller.allStudents[index].roll),
                        trailing:
                        InkWell(
                            onTap: () {
                              controller.deleteUser(controller
                                  .allStudents[index].id);
                              controller.allStudents.removeAt(index);

                              },
                            child: Icon(Icons.delete, color: Colors.red.shade300,))
                    ));
              },
            ) : noData();
          },
        ));
  }

  Widget pleaseWait() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        ),
        Text('please wait')
      ],
    );
  }
  Widget loading() {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(),
    );
  }

  Widget noData() {
    return const Center(child: Text('No any data yet'));
  }
}

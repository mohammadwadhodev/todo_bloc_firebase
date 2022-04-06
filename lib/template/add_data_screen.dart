import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_firebase/bloc/add_bloc/add_data_cubit.dart';
import 'package:todo_bloc_firebase/constants/constants.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<AddDataCubit>(context);
    return Scaffold(
      appBar: AppBar(
      title: const Center(child: Text('Add data')),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, kViewData);
        },
        child: const Icon(Icons.view_compact),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField(controller.nameController, 'Enter name'
            ),
            const SizedBox(height: 10),
            textField(controller.rollController, 'Enter roll no'),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: BlocBuilder<AddDataCubit, AddDataState>(
                builder: (context, state) {
                  return CupertinoButton(
                      color: state is LoadingState? Colors.grey: Colors.black54,
                      child:state is LoadingState? Center(child: CircularProgressIndicator()) : const Text('Save'),
                      onPressed: () {
                        controller.addData(controller.nameController.text,
                            controller.rollController.text);
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textField(controller, text) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: CupertinoTextField(
          controller: controller,
          placeholder: text,
        ));
  }

}

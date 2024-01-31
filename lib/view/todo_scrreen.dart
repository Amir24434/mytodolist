import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodolist/controller/task_controller.dart';
import 'package:mytodolist/view/add_task_screen.dart';
import 'package:mytodolist/view/widgets/task_tile.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Tasks",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => (controller.tasklist.isEmpty)
              ? Center(
                  child: Text(
                    "No Task Found",
                    style: text.headlineSmall,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: ListView.builder(
                    itemCount: controller.tasklist.length,
                    itemBuilder: ((context, index) => TaskTile(
                          size: size,
                          text: text,
                          time: controller.tasklist[index].taskCreated,
                          des: controller.tasklist[index].task,
                          onPressed: () {
                            controller.deleteTask(controller.tasklist[index]);
                          },
                        )),
                  ),
                ),
        ),
      ),
    );
  }
}

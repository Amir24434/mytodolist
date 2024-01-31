import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodolist/controller/task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "Add new task",
                style: text.headlineSmall,
              ),
              const Spacer(
                flex: 1,
              ),
              TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  if (controller.textEditingController!.text.isNotEmpty) {
                    controller.addTask();
                  } else {
                    Get.snackbar(
                      "No task added",
                      "Add a task",
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Add task",
                      style: text.labelLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

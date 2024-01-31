import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Import the get_storage package
import 'package:mytodolist/model/task.dart';

class TaskController extends GetxController {
  final _taskList = <Task>[].obs;

  List<Task> get tasklist => _taskList;

  TextEditingController? textEditingController;

  @override
  onInit() async {
    // Initialize getStorage in onInit
    await GetStorage.init();
    // Load tasks from local storage
    loadTasksFromStorage();

    super.onInit();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController!.clear();
  }

  void addTask() {
    String txt = textEditingController!.text;
    DateTime time = DateTime.now();

    _taskList.add(
      Task(
        task: txt,
        taskCreated: time.day.toString(),
      ),
    );

    // Save tasks to local storage
    saveTasksToStorage();

    textEditingController!.text = "";
  }

  void deleteTask(Task task) {
    tasklist.remove(task);

    // Save tasks to local storage after deletion
    saveTasksToStorage();
  }

  // Save tasks to local storage
  void saveTasksToStorage() {
    final box = GetStorage();
    box.write('tasks', _taskList.map((task) => task.toMap()).toList());
  }

  // Load tasks from local storage
  void loadTasksFromStorage() {
    final box = GetStorage();
    final storedTasks = box.read<List>('tasks') ?? [];

    _taskList.assignAll(
      storedTasks.map((taskMap) => Task.fromMap(taskMap)).toList(),
    );
  }
}

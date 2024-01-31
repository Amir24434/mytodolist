import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.size,
    required this.text,
    this.time,
    this.des,
    this.onPressed,
  });

  final Size size;
  final TextTheme text;

  final String? time, des;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        elevation: 3,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width * 0.1,
                height: double.maxFinite,
                color: Colors.green,
                child: Text(
                  "$time",
                  style: text.headlineSmall!.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "$des",
                    style: text.titleLarge,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.1,
                  height: double.maxFinite,
                  color: Colors.green,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

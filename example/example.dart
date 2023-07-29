import 'package:flutter/material.dart';
import 'package:expandable_section/expandable_section.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expand = !_expand;
            });
          },
          child: const Text(
            "Show more",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ExpandableSection(
          expand: _expand,
          child: const Text("This is the expanded value..."),
        )
      ],
    );
  }
}

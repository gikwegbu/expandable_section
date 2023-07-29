## Expandable Section

This is an expandable section widget where users gets to insert a section/widget they'd want to toggle. The toggle controller is totally provided by the user, that way there's more flexibility and no limitation on how to provide the header/toggle controller.

## Features

- A widget section which serves as a container to the child you'd wish to toggle it's visibility.

- A `fastOutSlowIn`  default but optional animation that allows you to control the kind of animation curve you want for the expanding section.

## Getting started

In the `pubspec.yaml` of you flutter project, add the following dependency:

```dart
dependencies:
 expandable_section: ^0.0.1
```

## Basic Usage

`ExpandableSection` has an `expand` boolean value, that is being controlled by your own custom header or widget, it also has a `child` value, where the supposed hidden widget's content lives and finally, an optional `curve` value to control the visibility toggle animation of hidden widget.

```dart
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

```

## FAQ
How to toggle the expansion widget

```dart
bool _expand = false;

onTap: () {
  setState(() {
   _expand = !_expand;
  });
},


```

## Example
You can find the example code [here](https://github.com/gikwegbu/example)
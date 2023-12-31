## Expandable Section

This is an expandable section widget where users gets to insert a section/widget they'd want to toggle. The toggle controller is totally provided by the user, that way there's more flexibility and no limitation on how to provide the header/toggle controller.

## Features

- A widget section which serves as a container to the child you'd wish to toggle it's visibility.

- A `fastOutSlowIn`  default but optional animation that allows you to control the kind of animation curve you want for the expanding section.

## Getting started

In the `pubspec.yaml` of you flutter project, add the following dependency:

```dart
dependencies:
 expandable_section: <latest_version>
```

## Output


![Expandable Section](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1l7ykx4vp0oh3mfjspja.gif)

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

## More Example

```dart
import 'package:flutter/material.dart';

import 'package:expandable_section/expandable_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isExpandImage = false;
  bool _isExpandCard = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expandable Section Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable Section'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: _isExpandImage
                          ? const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          : BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpandImage = !_isExpandImage;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Reveal our special Image",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(_isExpandImage
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      ExpandableSection(
                        expand: _isExpandImage,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              "https://images.pexels.com/photos/4491624/pexels-photo-4491624.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: _isExpandCard
                          ? const BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          : BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpandCard = !_isExpandCard;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Reviews ✨ ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(_isExpandCard
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      ExpandableSection(
                        expand: _isExpandCard,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 2, bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, purus non interdum porttitor, tortor quam pretium odio, a efficitur nunc tortor fringilla ligula. Vivamus lacinia tortor et dolor lacinia semper. Vestibulum egestas dolor eros, ut dignissim risus posuere vel. Fusce vel lobortis lectus, id imperdiet lacus. Integer accumsan luctus sollicitudin. Praesent vestibulum eros quis augue elementum, finibus ultricies purus convallis. Suspendisse et odio quis magna porta placerat non vel lacus. Pellentesque augue turpis, iaculis non enim id, vestibulum sodales arcu. Proin consectetur neque nibh, et eleifend nisi consequat ac. Phasellus vitae purus ut diam porta bibendum nec ac diam. Fusce fringilla malesuada risus a luctus. Sed ac arcu justo. Suspendisse potenti. Proin consequat mollis ligula, feugiat aliquet velit dignissim eu. Vestibulum aliquam ante quis posuere sagittis. Mauris vel est eros. Donec quis lobortis lectus, ac pulvinar elit. Donec vitae lorem id nisl facilisis ultricies non ut eros. Pellentesque ut tincidunt elit. Mauris mattis diam id massa pretium consectetur. Vivamus sapien dui, viverra id aliquam id, cursus interdum turpis. Sed sed risus leo. Curabitur egestas lacus tempus ligula vestibulum, a dictum nulla consequat. Curabitur fermentum, tortor non ultrices scelerisque, neque diam tincidunt sem, non consequat ex massa ac felis. Nulla vitae orci ac dui pretium cursus. Vivamus quis justo odio. Quisque lobortis orci risus, vitae molestie velit imperdiet vel.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.grey[850],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```



## Example
You can find the example code [here](https://github.com/gikwegbu/expandable_section/tree/main/example)
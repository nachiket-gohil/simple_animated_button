import 'package:flutter/material.dart';
import 'package:simple_animated_button/simple_animated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Animated Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Simple Animated Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              section(
                child: ElevatedLayerButton(
                  onClick: () {},
                  buttonHeight: 60,
                  buttonWidth: 270,
                  animationDuration: const Duration(milliseconds: 200),
                  animationCurve: Curves.ease,
                  topDecoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(),
                  ),
                  topLayerChild: Text(
                    "ElevatedLayerButton()",
                    style: monoStyle,
                  ),
                  baseDecoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(),
                  ),
                ),
              ),
              section(
                child: TrailingButton(
                  onClick: () {},
                  buttonWidth: 210,
                  buttonHeight: 50,
                  label: 'TrailingButton()',
                  labelStyle: monoStyle,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                  animationDuration: const Duration(milliseconds: 400),
                  trailingMovement: 10,
                  curve: Curves.ease,
                  enableAnimation: true,
                ),
              ),
              section(
                child: VerticalFillButton(
                  onClick: () {},
                  fillingDuration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  buttonWidth: 240,
                  buttonHeight: 45,
                  filledColor: Colors.amber,
                  initialThickness: 6,
                  cornerRadius: 10,
                  alignment: Alignment.center,
                  child: Text(
                    'VerticalFillButton()',
                    style: monoStyle,
                  ),
                ),
              ),
              section(
                child: HorizontalFillButton(
                  onClick: () {},
                  fillingDuration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                  buttonWidth: 270,
                  buttonHeight: 40,
                  cornerRadius: 10,
                  filledColor: Colors.amber,
                  initialThickness: 10,
                  alignment: Alignment.center,
                  child: Text(
                    'HorizontalFillButton()',
                    style: monoStyle,
                  ),
                ),
              ),
              section(
                child: RoundedFillButton(
                  onClick: () {},
                  buttonWidth: 240,
                  buttonHeight: 40,
                  fillRadius: 40,
                  alignment: Alignment.center,
                  filledColor: Colors.amber,
                  fillingDuration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                  showInitialShape: true,
                  child: Text(
                    'RoundedFillButton()',
                    style: monoStyle,
                  ),
                ),
              ),
              section(
                child: BouncingButton(
                  onClick: () {},
                  bouncingDuration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  buttonHeight: 45,
                  buttonWidth: 200,
                  buttonBouncingWidth: 30,
                  alignment: Alignment.center,
                  buttonDecoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "BouncingButton()",
                    style: monoStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget section({required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.only(bottom: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 0.3),
      ),
      child: child,
    );
  }

  TextStyle monoStyle = const TextStyle(
    fontSize: 18,
    fontFamily: 'Fira Mono',
    color: Color(0xff202020),
  );
}

# Simple Animated Button

#### This package contains efficient and simply designed animated buttons ready to use.

<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/simple_animated_button.gif"  width="400" alt="package preview">

## Getting Started

[1] Add the library as a dependency into your `pubspec.yaml` file.

```yaml
dependencies:
  simple_animated_button: ^0.0.1
```

[2] Run `flutter pub get`

Now in your Dart code, add import to use the package:

```dart
import 'package:simple_animated_button/simple_animated_button.dart';
```

## Usage Example

> You can also Render the Basic UI of button by just adding required parameters.

#### Elevated Layer Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/elevated.png" width="350" alt="elevated layer button preview">
`
    ElevatedLayerButton(
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
`

#### Horizontal Fill Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/horizontal.png" width="350" alt="horizontal fill button preview">
```dart
HorizontalFillButton(  
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
```

#### Vertical Fill Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/vertical.png" width="350" alt="vertical fill button preview">
```dart
VerticalFillButton(  
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
```

#### Rounded Fill Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/rounded.png" width="350" alt="rouded fill button preview">
```dart
RoundedFillButton(  
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
```

#### Bouncing Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/bounce.png" width="350" alt="bouncing button preview">
```dart
BouncingButton(  
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
```

#### Trailing Button
<img src="https://github.com/NachiketGohil/simple_animated_button/blob/03f111358480a8f0cc781a572e659aa6db5f9583/example/screenshots/trailing.png" width="350" alt="trailing button preview">
```dart
TrailingButton(  
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
  curve: Curves.ease,  
  trailingMovement: 10,  
),
```

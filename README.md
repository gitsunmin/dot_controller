# dot_controller

![logo](./assets/s_logo.png)

**dot_controller** is a Controller, Navigator, and Selector.

> You can run a function by simply moving Dot. You can also change the color and icon of Dot.

# Usage

## 1. Define Your Dot
you have to create a "Dot" that can move at a point on the screen.

```dart
Scaffold(
  ...,
  body: Stack(
    children: [
      YourWidget(),
      DotController(  // <-- this is your Dot
        actions: [],
      )
    ],
  ),
);
    
```

## 2. Add Your Action
You have to declare "Action," the destination of "Dot."

```dart
Scaffold(
  ...,
  body: Stack(
    children: [
      YourWidget(),
      DotController(  // <-- this is your Dot
        actions: [ // <--- your Actions
          ActionProp(
            icon: const Icon(Icons.add),
            onAccept: () {
              doSomething();
            },
          ),
          ActionProp(
            icon: const Icon(Icons.remove),
            onAccept: onAccept: () {
              doSomething();
            },
          ),
          ActionProp(
            icon: const Icon(Icons.backspace),
            onAccept: onAccept: () {
              doSomething();
            },
          ),
        ],
      )
    ],
  ),
);
```

## 3. Add Your Style
You can style your "Dot" and "Actions".

```dart

Scaffold(
  ...,
  body: Stack(
    children: [
      YourWidget(),
      DotController(  // <-- this is your Dot
        draggingBackgroundColor: Colors.amber,
        stickBackgroundColor: Colors.amber,
        actions: [ // <--- your Actions
          ActionProp(
            icon: const Icon(Icons.add),
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            onAccept: () {
              doSomething();
            },
          ),
          ActionProp(
            icon: const Icon(Icons.remove),
            backgroundColor: Colors.red,
            borderColor: Colors.black,
            onAccept: onAccept: () {
              doSomething();
            },
          ),
          ActionProp(
            icon: const Icon(Icons.backspace),
            backgroundColor: Colors.yellow,
            borderColor: Colors.black,
            onAccept: onAccept: () {
              doSomething();
            },
          ),
        ],
      )
    ],
  ),
);
```


# Example
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Counter',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          DotController(
            draggingBackgroundColor: Colors.amber,
            stickBackgroundColor: Colors.amber,
            actions: [
              ActionProp(
                icon: const Icon(Icons.add),
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                onAccept: _incrementCounter,
              ),
              ActionProp(
                icon: const Icon(Icons.remove),
                backgroundColor: Colors.red,
                borderColor: Colors.black,
                onAccept: _decrementCounter,
              ),
              ActionProp(
                icon: const Icon(Icons.backspace),
                backgroundColor: Colors.yellow,
                borderColor: Colors.black,
                onAccept: _initCounter,
              ),
            ],
          )
        ],
      ),
    );
  }
```
![example](./assets/example.GIF)


# License

[Apache-2.0 license](./LICENSE)

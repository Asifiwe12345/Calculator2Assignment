import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Drawer Navigation',
      theme: ThemeData(
        primarySwatch: Colors.green, // Changed from blue to green
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Navigation Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Changed from blue to green
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'), // Changed from 'Sign In' to 'Login'
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _tabController.animateTo(0); // Switch to Login tab
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Register'), // Changed from 'Sign Up' to 'Register'
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _tabController.animateTo(1); // Switch to Register tab
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _tabController.animateTo(2); // Switch to Calculator tab
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LoginScreen(), // Changed from SignInScreen to LoginScreen
          RegisterScreen(), // Changed from SignUpScreen to RegisterScreen
          CalculatorScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.green, // Changed from blue to green
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.login),
              text: 'Login', // Changed from 'Sign In' to 'Login'
            ),
            Tab(
              icon: Icon(Icons.person_add),
              text: 'Register', // Changed from 'Sign Up' to 'Register'
            ),
            Tab(
              icon: Icon(Icons.calculate),
              text: 'Calculator',
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget { // Changed from SignInScreen to LoginScreen
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Screen', // Changed from 'Sign In Screen' to 'Login Screen'
              style: TextStyle(fontSize: 24, color: Colors.green), // Updated color to green
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green), // Changed color to green
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignedInScreen()), // No change needed
                );
              },
              child: Text('Login'), // Changed from 'Sign In' to 'Login'
            ),
          ],
        ),
      ),
    );
  }
}

class SignedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.green, // Changed from default color to green
      ),
      body: Center(
        child: Text(
          'Welcome! You are now logged in.', // Changed from 'signed in' to 'logged in'
          style: TextStyle(fontSize: 24, color: Colors.green), // Updated color to green
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget { // Changed from SignUpScreen to RegisterScreen
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register Screen', // Changed from 'Sign Up Screen' to 'Register Screen'
              style: TextStyle(fontSize: 24, color: Colors.green), // Updated color to green
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green), // Changed color to green
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignedUpScreen()), // No change needed
                );
              },
              child: Text('Register'), // Changed from 'Sign Up' to 'Register'
            ),
          ],
        ),
      ),
    );
  }
}

class SignedUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.green, // Changed from default color to green
      ),
      body: Center(
        child: Text(
          'Welcome! You are now registered.', // Changed from 'signed up' to 'registered'
          style: TextStyle(fontSize: 24, color: Colors.green), // Updated color to green
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculation(),
      theme: ThemeData.dark(), // No change needed
    );
  }
}

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  List<dynamic> inputList = [0];
  String output = '0';

  void _handleClear() {
    setState(() {
      inputList = [0];
      output = '0';
    });
  }

  void _handlePress(String input) {
    setState(() {
      if (_isOperator(input)) {
        if (inputList.last is int) {
          inputList.add(input);
          output += input;
        }
      } else if (input == '=') {
        while (inputList.length > 2) {
          int firstNumber = inputList.removeAt(0) as int;
          String operator = inputList.removeAt(0);
          int secondNumber = inputList.removeAt(0) as int;
          int partialResult = 0;

          if (operator == '+') {
            partialResult = firstNumber + secondNumber;
          } else if (operator == '-') {
            partialResult = firstNumber - secondNumber;
          } else if (operator == '*') {
            partialResult = firstNumber * secondNumber;
          } else if (operator == '/') {
            partialResult = firstNumber ~/ secondNumber;
            if (secondNumber == 0) {
              partialResult = firstNumber; // Handle division by zero
            }
          }

          inputList.insert(0, partialResult);
        }

        output = '${inputList[0]}';
      } else {
        int? inputNumber = int.tryParse(input);
        if (inputNumber != null) {
          if (inputList.last is int && !_isOperator(output[output.length - 1])) {
            int lastNumber = (inputList.last as int);
            lastNumber = lastNumber * 10 + inputNumber;
            inputList.last = lastNumber;

            output = output.substring(0, output.length - 1) + lastNumber.toString();
          } else {
            inputList.add(inputNumber);
            output += input;
          }
        }
      }
    });
  }

  bool _isOperator(String input) {
    return ['+', '-', '*', '/'].contains(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.green, // Changed from default color to green
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green), // Updated color to green
                textAlign: TextAlign.right,
                decoration: InputDecoration(border: InputBorder.none),
                controller: TextEditingController()..text = output,
                readOnly: true,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  for (var i = 0; i <= 9; i++)
                    TextButton(
                      child: Text("$i", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                      onPressed: () => _handlePress("$i"),
                    ),
                  TextButton(
                    child: Text("C", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: _handleClear,
                  ),
                  TextButton(
                    child: Text("+", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: () => _handlePress("+"),
                  ),
                  TextButton(
                    child: Text("-", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: () => _handlePress("-"),
                  ),
                  TextButton(
                    child: Text("*", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: () => _handlePress("*"),
                  ),
                  TextButton(
                    child: Text("/", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: () => _handlePress("/"),
                  ),
                  TextButton(
                    child: Text("=", style: TextStyle(fontSize: 25, color: Colors.green)), // Updated color to green
                    onPressed: () => _handlePress("="),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

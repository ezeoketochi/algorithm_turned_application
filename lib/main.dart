import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TextField Challenge App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const BodyPage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UnknownClass extends StatefulWidget {
  const UnknownClass({Key? key}) : super(key: key);

  @override
  _UnknownClassState createState() => _UnknownClassState();
}

class _UnknownClassState extends State<UnknownClass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  TextEditingController emailController = TextEditingController();
  int inttextInput = 0;
  String textInput = '';
  String stringtextInput = '';
  int indexnumber = 0;
  int finalintresult = 0;
  String solution = '';

  indexnumberFunction() {
    if (emailController.text.length == 1) {
      indexnumber = 0;
    } else if (emailController.text.length == 2) {
      indexnumber = 1;
    } else if (emailController.text.length == 3) {
      indexnumber = 2;
    }
  }

  submitFunction() {
    if (emailController.text.length == 3) {
      String one = stringtextInput[0];
      String two = stringtextInput[1];
      String three = stringtextInput[2];

      int intone = int.parse(one);
      int inttwo = int.parse(two);
      int intthree = int.parse(three);

      if ((textInput.length == 3) && (inttextInput % intone == 0) && (inttextInput % inttwo == 0) && (inttextInput % intthree == 0)
      ) {
        solution = '3';
      }

      else {solution = '1';}

      setState(() {
        finalintresult = (intone + intthree + inttwo);
      });
    }
  }

  numbersOnly(String craze) {
    if (craze.contains(
      RegExp(r'[a-z]'),
    )) {
      setState(() {
        emailController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            // color: Colors.grey,
            // margin: const EdgeInsets.all(2),
            height: 85,
            child: TextField(
              onSubmitted: submitFunction(),
              keyboardType: TextInputType.number,
              maxLength: 3,
              onChanged: (value) => setState(() {
                textInput = value;
                stringtextInput = textInput.toString();
                debugPrint(stringtextInput);
                numbersOnly(emailController.text);
                inttextInput = int.parse(textInput);
                indexnumberFunction();
              }),
              // onTap: mathsFunction(textInput),
              controller: emailController,
              decoration: InputDecoration(
                errorText: emailController.text.length == 3
                    ? "Proper Length is obeyed"
                    : 'Maximum input length is 3',
                // "Maxmimum Input length is 3",
                errorStyle: const TextStyle(color: Colors.blue),

                suffixIcon: emailController.text.isEmpty
                    ? Container(
                        // color: Colors.blue,
                        width: 0,
                      )
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => emailController.clear(),
                      ),
                hintText: "123",
                labelText: "Input a 3 letter long number only",
                floatingLabelStyle: const TextStyle(color: Colors.blue),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            height: 50,
            width: 100,
            child: Center(
              child: Text(
                finalintresult.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            color: Colors.black,
            child: Center(
              child: Text(
                emailController.text.isEmpty
                    ? ""
                    : stringtextInput[indexnumber],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            color: Colors.black,
            child: Center(
              child: Text(
                "$inttextInput",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            color: Colors.black,
            child:  Center(
              child: Text(
                solution,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

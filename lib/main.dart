import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VerifyMobilePin(title: 'Verify Phone'),
    );
  }
}

class VerifyMobilePin extends StatefulWidget {
  VerifyMobilePin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VerifyMobilePinState createState() => _VerifyMobilePinState();
}

class _VerifyMobilePinState extends State<VerifyMobilePin> {
  String finalPin = '';
  List<String> _pin;
  List<FocusNode> _focusNodes;
  List<bool> _showingCursor;
  List<TextEditingController> _pinEditingController;

  @override
  void initState() {
    super.initState();
    _pin = List<String>(6);
    _focusNodes = List<FocusNode>(6);
    _showingCursor = List<bool>(6);
    _pinEditingController = List<TextEditingController>(6);

    for (int i = 0; i < 6; i++) {
      if (_focusNodes[i] == null && _showingCursor[i] == null) {
        _focusNodes[i] = FocusNode();
        _showingCursor[0] = true;
        _pinEditingController[i] = TextEditingController();
      }

      // if (_showingCursor[i] == null) {
      //   _showingCursor[0] = true;
      // }
      _pinEditingController[i].addListener(() {});
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {}
      });

      // TODO: Resolve error - cannot clear fixed-length list
      // _pin.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pin.clear();
    finalPin = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF75AE43),
      appBar: AppBar(
        backgroundColor: Color(0XFF75AE43),
        elevation: 0,
        // Option 1 - title
        title: Center(
            child: DecoratedBox(
          decoration: ShapeDecoration(
            color: Color(0XFFFDCA44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0XFF231F20),
                  fontWeight: FontWeight.w700),
            ),
          ),
        )),
        // Option 1 - leading icon
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _pinEditingController[0],
                        showCursor: true,
                        autofocus: true,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        onChanged: (val) {
                          if (val.isNotEmpty && val.length == 1) {
                            FocusScope.of(context).requestFocus(_focusNodes[1]);
                            _showingCursor[1] = true;
                            _pin[0] = val;
                            debugPrint('_pin[0]: $_pin[0]');
                          }
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _pinEditingController[1],
                        showCursor: _showingCursor[1],
                        focusNode: _focusNodes[1],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        onChanged: (val) {
                          if (val.isNotEmpty && val.length == 1) {
                            FocusScope.of(context).requestFocus(_focusNodes[2]);
                            _showingCursor[2] = true;
                            _pin[1] = val;
                            debugPrint('_pin[1]: $_pin[1]');
                          }
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _pinEditingController[2],
                        showCursor: _showingCursor[2],
                        focusNode: _focusNodes[2],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        onChanged: (val) {
                          if (val.isNotEmpty && val.length == 1) {
                            FocusScope.of(context).requestFocus(_focusNodes[3]);
                            _showingCursor[3] = true;
                            _pin[2] = val;
                            debugPrint('_pin[2]: $_pin[2]');
                          }
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _pinEditingController[3],
                        showCursor: _showingCursor[3],
                        focusNode: _focusNodes[3],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        onChanged: (val) {
                          if (val.isNotEmpty && val.length == 1) {
                            FocusScope.of(context).requestFocus(_focusNodes[4]);
                            _showingCursor[4] = true;
                            _pin[3] = val;
                            debugPrint('_pin[3]: $_pin[3]');
                          }
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Didn\'t receive code? Request again',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 22.0,
            ),
            FlatButton(
              color: Color(0XFFFDCA44),
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(32.0, 12.0, 32.0, 12.0),
              splashColor: Color(0XFFFDCA44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                if (_pin.isNotEmpty) {
                  hideTextVisibility(true);
                  debugPrint('on click print value: ($_pin)');
                  finalPin = _pin.join();
                  debugPrint('Final pin value: ($finalPin)');
                } else {
                  hideTextVisibility(false);
                }
                try {
                  SystemChannels.textInput.invokeMapMethod('TextInput.hide');
                } on Exception catch (e) {
                  print(e.runtimeType);
                }
                // _pin.clear();
              },
              child: Text(
                "Verify and Create Account",
                style: TextStyle(
                    color: Color(0XFF231F20),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Text('$finalPin')
          ],
        ),
      ),
    );
  }

  //created a method to show and hide the text using visibility widget
  hideTextVisibility(bool visibilityStatus) {
    if (visibilityStatus) {
      setState(() {
        finalPin = _pin.join();
      });
    } else {
      finalPin = '';
    }
  }
}

// TODO: Make reusable TextField instead of 6 individuals for pin number
class MobilePinTextField extends StatelessWidget {
  TextEditingController pinEditingController;
  List<bool> showingCursor;
  List<FocusNode> focusNodes;
  List<String> pin;

  MobilePinTextField(
      {this.pinEditingController,
      this.showingCursor,
      this.focusNodes,
      this.pin});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pinEditingController,
      showCursor: showingCursor[0],
      focusNode: focusNodes[0],
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: (val) {
        if (val.isNotEmpty && val.length == 1) {
          pin[0] = val;
          debugPrint('pin[0]: $pin[0]');
        }
      },
    );
  }
}

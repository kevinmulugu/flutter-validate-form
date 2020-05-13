import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My atpp',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Form Validation'),
      backgroundColor: Colors.pink[800],
      elevation: 0,
    ),
    body: MyCustomFom()
  )
));

class MyCustomFom extends StatefulWidget {
  @override
  _MyCustomFomState createState() => _MyCustomFomState();
}

class _MyCustomFomState extends State<MyCustomFom> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return  Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add TextFormFields and RaisedButton here.
            TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'This Field is Required';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 16.0,

              ),
            ),
            SizedBox(height: 20.0,),
            RaisedButton.icon(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Submiting data')));

                  }
                },
                icon: Icon(Icons.business_center, color: Colors.white,),
                color: Colors.pink[500],
                label: Text('Submit',
                style: TextStyle(
                  color: Colors.white
                ),)
            )
          ],
        ),
      ),
    );
  }
}


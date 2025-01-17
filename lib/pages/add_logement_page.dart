import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/logement_controller.dart';
import 'package:rent_it_3/models/logement.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddLogementPage extends StatefulWidget {
  @override
  _AddLogementPageState createState() => _AddLogementPageState();
}

class _AddLogementPageState extends State<AddLogementPage> {
  final LogementController _logementController = LogementController();
  final picker = ImagePicker();
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();
  Logement _logement = Logement(
    name: '',
    adresse: '',
    typeLogement: 'apartment',
    nombreChambres: 0,
    prix: 0.0,
    description: '',
    status: 'available',
    area: 0.0,
    beds: 0,
    baths: 0,
    garage: 0,
    city: '',
    imagePath: '', // Initialize the imagePath field
  );

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // use `.pickImage` method
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Logement')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _imageFile != null
                    ? Image.file(_imageFile!)
                    : Text('No image selected.'),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Select Image'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) => setState(() {
                    _logement = _logement.copyWith(name: value);
                  }),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
                ),
                // Add other fields here similarly...
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      if (_imageFile != null) {
                        await _logementController.insertLogement(_logement, _imageFile!);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an image.')));
                      }
                    }
                  },
                  child: Text('Add Logement'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

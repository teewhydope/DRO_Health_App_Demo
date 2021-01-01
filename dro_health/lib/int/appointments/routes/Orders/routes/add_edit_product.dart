import 'package:dro_health/models/drug_product.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditProduct extends StatefulWidget {
  static const routename = '/add_edit_product';

  @override
  _AddEditProductState createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _editedProduct = DrugProduct(
      id: null,
      title: '',
      description: '',
      mgQuantity: '',
      price: 0,
      imageUrl: '');

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg') &&
              !_imageUrlController.text.endsWith('.png'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    Provider.of<DrugProducts>(context, listen: false)
        .addProduct(_editedProduct);
    Navigator.of(context).pop();
    //print(_editedProduct.description);
    //print(_editedProduct.mgQuantity);
    //print(_editedProduct.price);
    //print(_editedProduct.title);
    //print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add/Edit Product',
          ),
          actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveForm)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _editedProduct = DrugProduct(
                    id: null,
                    title: value,
                    description: _editedProduct.description,
                    mgQuantity: _editedProduct.mgQuantity,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _editedProduct = DrugProduct(
                    id: null,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    mgQuantity: _editedProduct.mgQuantity,
                    price: int.parse(value),
                    imageUrl: _editedProduct.imageUrl,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a price';
                    }
                    {
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (int.parse(value) <= 0) {
                        return 'Please enter a number greater than zero';
                      }
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mg Quantity'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _editedProduct = DrugProduct(
                    id: null,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    mgQuantity: value,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide mgQuantity';
                    }
                    if (value.length < 5) {
                      return 'Should be at least 10 characters long';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  textInputAction: TextInputAction.newline,
                  maxLines: 3,
                  onSaved: (value) => _editedProduct = DrugProduct(
                    id: null,
                    title: _editedProduct.title,
                    description: value,
                    mgQuantity: _editedProduct.mgQuantity,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a description';
                    }
                    if (value.length < 10) {
                      return 'Should be at least 10 characters long';
                    }
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )),
                        child: _imageUrlController.text.isEmpty
                            ? Center(child: Text('Please enter a URl'))
                            : FittedBox(
                                child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              )),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imageUrlController,
                        onSaved: (value) => _editedProduct = DrugProduct(
                          id: null,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          mgQuantity: _editedProduct.mgQuantity,
                          price: _editedProduct.price,
                          imageUrl: value,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide an image URL';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter a valid URL';
                          }
                          if (!value.endsWith('.jpg') &&
                              !value.endsWith('.jpeg') &&
                              !value.endsWith('.png')) {
                            return 'please provide a valid image URL';
                          }
                          return null;
                        },
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}

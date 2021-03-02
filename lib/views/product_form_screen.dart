import 'package:flutter/material.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener(_updateImage);
  }

  void _updateImage() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImage);
    _imageUrlFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Preço'),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocusNode,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descrição'),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              focusNode: _descriptionFocusNode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'URL da Imagem'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.none,
                    focusNode: _imageUrlFocusNode,
                    controller: _imageUrlController,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(
                    top: 8,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: _imageUrlController.text.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text('Informe a URL'),
                          ],
                        )
                      : FittedBox(
                          child: Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

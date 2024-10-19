import 'package:flutter/material.dart';

// Widget reutilizable para campos de texto con menú desplegable
class CustomTextFieldDropdown extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String> options;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double width;
  final double height;

  const CustomTextFieldDropdown({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.options,
    this.borderColor = Colors.orange,
    this.borderWidth = 2.0,
    this.borderRadius = 5.0,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return options.where((String option) {
            return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          controller.text = selection;
        },
        fieldViewBuilder: (context, fieldController, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: fieldController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4A4A4A)), 
                    onPressed: () {}, // Icono indicativo de dropdown
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: borderColor), // Icono para limpiar el campo
                    onPressed: () {
                      fieldController.clear(); // Limpiar el campo de texto
                    },
                  ),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200.0, // Altura máxima del desplegable
                  maxWidth: MediaQuery.of(context).size.width - 40, // Ajustar ancho de la pantalla
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        onSelected(option); // Seleccionar opción
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

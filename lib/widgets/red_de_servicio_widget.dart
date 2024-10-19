import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:siven_app/core/services/catalogo_service_red_servicio.dart';
import 'package:siven_app/core/services/selection_storage_service.dart';

class RedDeServicioWidget extends StatefulWidget {
  final CatalogServiceRedServicio catalogService;
  final SelectionStorageService selectionStorageService;

  const RedDeServicioWidget({
    Key? key,
    required this.catalogService,
    required this.selectionStorageService,
  }) : super(key: key);

  @override
  _RedDeServicioWidgetState createState() => _RedDeServicioWidgetState();
}

class _RedDeServicioWidgetState extends State<RedDeServicioWidget> {
  String? selectedSilaisId;
  String? selectedUnidadSaludId;
  List<Map<String, dynamic>> silaisList = [];
  List<Map<String, dynamic>> establecimientosList = [];

  @override
  void initState() {
    super.initState();
    widget.selectionStorageService.clearSelections().then((_) {
      _initializeData();
    });
  }

  Future<void> _loadSilais() async {
    try {
      final silaisData = await widget.catalogService.getAllSilais();
      if (mounted) {
        setState(() {
          silaisList = silaisData;
        });
      }
    } catch (e) {
      print('Error al cargar SILAIS: $e');
    }
  }

// Cargar la lista de establecimientos de base al SILAIS seleccionado
  Future<void> _loadEstablecimientos(int idSilais) async {
    try {
      final establecimientosData =
          await widget.catalogService.getEstablecimientosBySilais(idSilais);
      if (mounted) {
        setState(() {
          establecimientosList = establecimientosData;
        });
      }
    } catch (e) {
      print('Error al cargar establecimientos: $e');
    }
  }

// Controlar la carga de SILAIS y cache
  // Controlar la carga de SILAIS y cache
  Future<void> _initializeData() async {
    // Cargar las selecciones guardadas
    final cachedSilaisId =
        await widget.selectionStorageService.getSelectedSilais();
    final cachedUnidadSaludId =
        await widget.selectionStorageService.getSelectedUnidadSalud();

    // Si hay una selección cacheada, cargarla
    if (cachedSilaisId != null && cachedSilaisId.isNotEmpty) {
      if (!mounted) return; // Verificar si el widget sigue montado
      setState(() {
        selectedSilaisId = cachedSilaisId;
        selectedUnidadSaludId = cachedUnidadSaludId?.isNotEmpty == true
            ? cachedUnidadSaludId
            : null;
      });

      // Cargar los establecimientos correspondientes al SILAIS cacheado
      await _loadEstablecimientos(int.parse(cachedSilaisId));
    }

    // Cargar los SILAIS solo si no hay selección previa
    if (selectedSilaisId == null) {
      await _loadSilais();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dropdownSearchField(
          'SILAIS',
          selectedSilaisId,
          silaisList,
          TextEditingController(),
          (val) async {
            setState(() {
              selectedSilaisId = val;
              selectedUnidadSaludId = null;
              establecimientosList.clear();
            });
            await widget.selectionStorageService.saveSelectedSilais(val!);
            await _loadEstablecimientos(int.parse(val));
          },
          () {
            setState(() {
              selectedSilaisId = null;
              establecimientosList.clear();
            });
            widget.selectionStorageService.clearSelections();
          },
        ),
        const SizedBox(height: 30.0),
        dropdownSearchField(
          'Seleccione Unidad de Salud',
          selectedUnidadSaludId,
          establecimientosList,
          TextEditingController(),
          (val) async {
            setState(() {
              selectedUnidadSaludId = val;
            });
            await widget.selectionStorageService.saveSelectedUnidadSalud(val!);
          },
          () {
            setState(() {
              selectedUnidadSaludId = null;
            });
            widget.selectionStorageService.clearSelections();
          },
        ),
      ],
    );
  }

  Widget dropdownSearchField(
    String label,
    String? currentValue,
    List<Map<String, dynamic>> items,
    TextEditingController controller,
    ValueChanged<String?> onChanged,
    VoidCallback onClearSelection,
  ) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Buscar $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 122, 193, 255),
                width: 2.0,
              ),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onClearSelection,
            ),
          ),
        ),
        emptyBuilder: (context, searchEntry) => Center(
          child: Text('No hay coincidencias de $label'),
        ),
        fit: FlexFit.tight,
      ),

      // Mapeamos la lista de items para mostrar solo los nombres en el dropdown
      items: items.map((item) => item['nombre'].toString()).toList(),

      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 122, 193, 255),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 122, 193, 255),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onClearSelection,
          ),
        ),
      ),

      // Definimos el valor seleccionado basado en currentValue (el ID que tenemos)
      selectedItem: currentValue != null
          ? items.firstWhere(
              (item) => item['id_silais'].toString() == currentValue,
              orElse: () => {
                    'nombre': ''
                  })['nombre'] // Usar 'orElse' para evitar el error
          : null,

      onChanged: (value) {
        // Buscamos el ID basado en el nombre seleccionado y lo pasamos al callback
        final selectedId = items
            .firstWhere((item) => item['nombre'] == value,
                orElse: () => {'id_silais': ''})['id_silais']
            .toString(); // Manejar orElse
        onChanged(selectedId.isNotEmpty
            ? selectedId
            : null); // Pasar el ID o null si no se encontró
      },

      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? 'Seleccione $label');
      },
    );
  }
}

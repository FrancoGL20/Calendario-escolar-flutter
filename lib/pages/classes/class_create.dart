import 'package:calendario_escolar/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import '../app_bar.dart';

class CreateCl extends StatefulWidget {
  const CreateCl({super.key});

  @override
  State<CreateCl> createState() => _CreateClState();
}

class _CreateClState extends State<CreateCl> {
  final _formKey = GlobalKey<FormState>();
  final decorationForTextFields = InputDecoration(
      labelText: "Nombre",
      hintText: "Clase X",
      icon: Icon(Icons.drive_file_rename_outline,color: ColorsF().escoger("gris")),

      hintStyle: TextStyle(
        color: ColorsF().escoger("gris")
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 119, 255, 123),width: 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 175, 160, 76),width: 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 254, 0, 0),width: 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 217, 0, 255),width: 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarF.crearAppBar(context, "Creación de materia"),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(top: 25.0, left: 22.0, right: 22.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Creación de materia",
                    style: TextStyle(fontSize: 40.0, fontFamily: 'Lato'),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    decoration: decorationForTextFields,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Ingresar nombre';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Horario",
                      hintText: "Inicio - Fin",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.schedule),
                    ),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Ingresar horario';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Salón",
                      hintText: "Edificio-Salon",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.location_on),
                    ),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Ingresar nombre de salón';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Días de clase",
                      hintText: "Dia 1, Dia 2",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.date_range),
                    ),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Ingresar días de clase';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Link de imagen",
                      hintText: "http://dominio/nombre.png",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.image),
                    ),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Ingresar link de imágen png';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                      width: 200.0,
                      height: 40.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsF().escoger("negro"),
                            foregroundColor: ColorsF().escoger("blanco")),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 17.0, fontFamily: 'Lato'),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a Snackbar.
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                'Creando materia ...',
                                style: TextStyle(
                                    fontFamily: 'Lato', fontSize: 20.0),
                              ),
                              backgroundColor: ColorsF().escoger("primario"),
                            ));
                          }
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
          ),
        )));
  }
}

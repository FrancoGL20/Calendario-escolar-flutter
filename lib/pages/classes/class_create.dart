import 'package:calendario_escolar/common_widgets/colors.dart';
import 'package:calendario_escolar/services/operations.dart';
import 'package:flutter/material.dart';
import '../app_bar.dart';
import 'class.dart';
import '../../common_widgets/decoration_of_text_form_field.dart';

class CreateCl extends StatefulWidget {
  const CreateCl({super.key});

  @override
  State<CreateCl> createState() => _CreateClState();
}

class _CreateClState extends State<CreateCl> {
  Class classToUpload = Class("", "", "", "", "");
  final _formKey = GlobalKey<FormState>();

  TextEditingController classImageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController scheduleController = TextEditingController();
  TextEditingController classroomController = TextEditingController();
  TextEditingController daysController = TextEditingController();

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
                    height: 31,
                  ),
                  TextFormField(
                      controller: nameController,
                      decoration: decorationForTextFormFields.copyWith(
                        labelText: "Nombre",
                        hintText: "Clase X",
                        icon: Icon(Icons.drive_file_rename_outline,
                            color: ColorsF().escoger("gris")),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return '* Ingresar nombre';
                        }
                        return null;
                      })),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      controller: scheduleController,
                      decoration: decorationForTextFormFields.copyWith(
                        labelText: "Horario",
                        hintText: "Inicio - Fin",
                        icon: Icon(Icons.schedule,
                            color: ColorsF().escoger("gris")),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return '* Ingresar horario';
                        }
                        return null;
                      })),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      controller: classroomController,
                      decoration: decorationForTextFormFields.copyWith(
                        labelText: "Salón",
                        hintText: "Edificio-Salon",
                        icon: Icon(Icons.location_on,
                            color: ColorsF().escoger("gris")),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return '* Ingresar nombre de salón';
                        }
                        return null;
                      })),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      controller: daysController,
                      decoration: decorationForTextFormFields.copyWith(
                        labelText: "Días de clase",
                        hintText: "Dia 1, Dia 2",
                        icon: Icon(Icons.date_range,
                            color: ColorsF().escoger("gris")),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return '* Ingresar días de clase';
                        }
                        return null;
                      })),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      controller: classImageController,
                      decoration: decorationForTextFormFields.copyWith(
                        labelText: "Link de imagen",
                        hintText: "http://dominio/nombre.png",
                        icon:
                            Icon(Icons.image, color: ColorsF().escoger("gris")),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return '* Ingresar link de imágen png';
                        }
                        return null;
                      })),
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 500),
                              content: Text(
                                'Creando materia ...',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsF().escoger("blanco")),
                              ),
                              backgroundColor: ColorsF().escoger("negro"),
                            ));
                            classToUpload.classImage =
                                classImageController.text;
                            classToUpload.name = nameController.text;
                            classToUpload.schedule = scheduleController.text;
                            classToUpload.classroom = classroomController.text;
                            classToUpload.days = daysController.text;
                            print(classToUpload.printObject());

                            uploadClass(
                              classToUpload.classImage,
                              classToUpload.name,
                              classToUpload.schedule,
                              classToUpload.classroom,
                              classToUpload.days
                            ).then((value) => 
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Materia creada correctamente',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsF().escoger("blanco")),
                                ),
                                backgroundColor:
                                    ColorsF().escoger("negro"),
                              ))
                            );
                            classImageController.clear();
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

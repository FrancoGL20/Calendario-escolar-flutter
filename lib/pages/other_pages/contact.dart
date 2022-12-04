import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import '../../common_widgets/app_bar.dart';
import '../../common_widgets/colors.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  final _phone = '0123456789';

  @override
  void initState() {
    super.initState();
    // verifica si se permite el hacer llamada
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    // dirección url a whatsapp
    final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: '52$_phone?text=mensaje%20ejemplo');
    // https://www.youtube.com/@francisco_gl4203
    final Uri linkToYoutube = Uri(
        scheme: 'https', host: 'www.youtube.com', path: '@francisco_gl4203');

    // variables que definen espacios y estilos
    var textStyles = TextStyle(
      fontSize: 18.0,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      color: ColorsF().escoger("gris_claro"),
    );
    const textSpaces = EdgeInsets.only(top: 16.0, bottom: 13.0);
    var buttonColors = ColorsF().colorElevatedButton("gris_oscuro", "negro");
    var buttonWidth = 300.0;
    var buttonHeight = 50.0;

    return Scaffold(
      appBar: AppBarF.crearAppBar(context, "Contactanos"),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // espacio arriba del titulo
              const SizedBox(
                height: 100,
              ),
              // titulo
              const Text(
                "Contactanos",
                style: TextStyle(fontSize: 40.0, fontFamily: 'Lato'),
              ),
              // espacio debajo del titulo
              const SizedBox(
                height: 50,
              ),

              // etiqueta llamada
              Padding(
                padding: textSpaces,
                child: Text(
                  "Llamanos ($_phone)",
                  style: textStyles,
                ),
              ),
              // boton para llamada
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  style: buttonColors,
                  onPressed: _hasCallSupport
                      ? () => setState(() {
                            _launched = _makePhoneCall(_phone);
                          })
                      : null,
                  child: _hasCallSupport
                      ? const Text(
                          'Llamar',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          'Llamadas no soportadas',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              // espacio bajo boton llamada
              const SizedBox(
                height: 35,
              ),

              // etiqueta de boton whatsapp
              Padding(
                padding: textSpaces,
                child: Text(
                  "Envianos Whatsapp ($_phone)",
                  style: textStyles,
                ),
              ),
              // abrir aplicación whatsapp
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  style: buttonColors,
                  onPressed: () => setState(() {
                    _launched = _launchUniversalLinkIos(toLaunch);
                  }),
                  child: const Text(
                    'Enviar Whatsapp',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // espacio bajo abrir app whatsapp
              const SizedBox(
                height: 35,
              ),

              // etiqueta youtube
              Padding(
                padding: textSpaces,
                child: Text(
                  "Visita nuestro canal de youtube (${linkToYoutube.path})",
                  style: textStyles,
                ),
              ),
              // abrir youtube
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  style: buttonColors,
                  onPressed: () => setState(() {
                    _launched = _launchUniversalLinkIos(linkToYoutube);
                  }),
                  child: const Text(
                    'Abrir Youtube',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // espacio bajo abrir youtube
              const SizedBox(
                height: 35,
              ),

              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_app/other_view/list_view.dart';
import 'package:first_app/other_view/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // fontFamily: 'Oswald', // kalo mau ganti seluruh font app
        textTheme: GoogleFonts.alikeTextTheme(), // kalo pake google fonts
      ),
      // home: const Scaffold(
      //   body: Center(
      //     // child: Heading(text: "Hello World!"),
      //     child: BiggerText(text: "Hello World!"),
      // home: const FirstScreen(),
      home: const ContohNavigatorPush(),
    );
  }
}

// // Contoh Stateless Widget = statis
// class Heading extends StatelessWidget {
//   final String text;
//
//   const Heading({super.key, required this.text});
//
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 24.0,
//         fontWeight: FontWeight.bold
//       ),
//     );
//   }
// }
//
// // Contoh Stateful Widget = dinamis
// class BiggerText extends StatefulWidget {
//   final String text;
//
//   const BiggerText({super.key, required this.text});
//
//   @override
//   State<BiggerText> createState() => _BiggerTextState();
// }
//
// class _BiggerTextState extends State<BiggerText> {
//   double _textSize = 16.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(widget.text, style: TextStyle(fontSize: _textSize)),
//         ElevatedButton(onPressed: () {
//           setState(() {
//             _textSize = 32.00;
//           });
//         }, child: const Text("Perbesar")),
//         ElevatedButton(onPressed: () {
//           setState(() {
//             _textSize = 8.00;
//           });
//         }, child: const Text("Perkecil"))
//       ],
//     );
//   }
// }

// NOTE: LAYOUTING: Column (Vertical) and Row (Horizontal), ListView (Scroll, Stack (Menumpuk di Widget lain)
// NOTE: INPUT: TextField
// NOTE: BUTTON: ElevatedButton, OutlinedButton and DropDownButton

// SCAFFOLD: 1) AppBar, 2) Body, 3) FloatingButton (FAB)

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First Screen App"), // Title AppBar
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, // Background AppBar
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          // Search Icon
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ), // Navbar Icon
      ),
      body:
          // SizedBox( // ini kayak div tapi transparan (hanya kasih width dan height tanpa parameter lain lagi), kalo center di dalem sizedbox maka, centernya hanya di area itu
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // kalo ini baru kayak div, bisa kasih margin, padding, color
                    width: double.infinity,
                    height: 150,
                    // color: Colors.amber,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      // kalo pake decoration, color harus dalem decoration
                      color: Colors.amber,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      // kalo .all(Radius.circular(20)) gitu, selain itu ada: .vertical, .horizontal, .only
                      boxShadow: [
                        // boxshadow bisa nerima lebih dari satu boxshadow
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(0, 5), //(horizontal, vertical)
                        ),
                      ],
                    ),
                    child: Center(
                      // supaya persis di tengah (horizontal, vertical)
                      child: Row(
                        // kalo kolom tinggal ubah jadi Column
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ini axis kalo row berarti horizontal, kalo column berarti vertical, kalo CrossAxis itu lawannya. (start, end, center, space(spaceEvenly, spaceAround, spaceBetween)
                        children: [
                          ColoredBox(
                            color: Color(0xFF2DBD3A),
                            // kalo mau pake custom color, pakenya Color(), kalo dari library pake Colors.xxx
                            child: Padding(
                              padding:
                                  // EdgeInsets.all(50), // padding ke semua sisi
                                  EdgeInsets.symmetric(
                                    // padding cuma vertical dan horizontal
                                    vertical: 30,
                                    horizontal: 20,
                                  ),
                              // EdgeInsets.only( // khusus sisi tertentu
                              //   top: 20,
                              //   left: 40,
                              // ),
                              child: Text(
                                "ini Padding",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ColoredBox(
                            color: Color(0xFF2DBD3A),
                            // kalo mau pake custom color, pakenya Color(), kalo dari library pake Colors.xxx
                            child: Padding(
                              padding:
                                  // EdgeInsets.all(50), // padding ke semua sisi
                                  EdgeInsets.symmetric(
                                    // padding cuma vertical dan horizontal
                                    vertical: 30,
                                    horizontal: 20,
                                  ),
                              // EdgeInsets.only( // khusus sisi tertentu
                              //   top: 20,
                              //   left: 40,
                              // ),
                              child: Text(
                                "ini Padding",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("ElevatedButton"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            padding: EdgeInsets.all(20),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("OutlinedButton"),
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: Text("FilledButton"),
                        ),
                        TextButton(onPressed: () {}, child: Text("TextButton")),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_up),
                        ),
                        MyDropDownWidget(),
                      ],
                    ),
                  ),
                  TextFieldWidget(),
                  SwitchWidget(),
                  RadioWidget(),
                  CheckboxWidget(),
                  Image.network(
                    // input gambar
                    'https://picsum.photos/200/300',
                    width: 200,
                    height: 200,
                    // fit: BoxFit.cover, // maksa kepotong tapi full utuh di bingkai
                    // fit: BoxFit.contain, // diperkecil pokoknya semua keliatan tapi ga ke fill full di bingkai
                    fit: BoxFit.fill,
                    // fill full di bingkai dan semua keliatan tapi ke stretch
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, child, stackTrace) {
                      return Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                  // loadingBuilder (memantau progres pengunduhan data/foto) dan errorBuilder (menangkap kegagalan akses url) sebagai bentuk loading saat image belom ada
                  Image.asset(
                    'assets/images/yato.jpeg',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    'Custom Font: Oswald',
                    style: TextStyle(fontFamily: 'Oswald', fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: "ini menu 1",
          ),
          // harus ada label yg bedain setiap bottom nav bar nya
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: "ini menu 2",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: "ini menu 3",
          ),
        ],
      ),
    );
  }
}

// DROPDOWN - INPUT

class MyDropDownWidget extends StatefulWidget {
  const MyDropDownWidget({super.key});

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: const <DropdownMenuItem<String>>[
        DropdownMenuItem<String>(value: "Dart", child: Text("Dart")),
        DropdownMenuItem<String>(value: "Kotlin", child: Text("Kotlin")),
      ],
      value: language,
      hint: const Text("Select Language"),
      onChanged: (String? selectedLanguage) {
        setState(() {
          language = selectedLanguage;
        });
      },
    );
  }
}

// TEXTFIELD - INPUT

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller =
      TextEditingController(); // definisiin variabel dari TextEditingController

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          // panggil controller supaya textfield bisa di baca editingnya
          keyboardType: TextInputType.text,
          obscureText: false,
          decoration: const InputDecoration(
            hintText: 'Write your name here...',
            labelText: 'Your Name',
          ),
          // onChanged: (String value) { // ini setiap perubahan di laporin
          //   debugPrint("Updated : $value"); // print di terminal
          // },
          onSubmitted: (String value) {
            // ini tunggu di klik ok dulu di keyboard
            debugPrint("Submitted : $value");
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            showDialog(
              // popup
              context: context,
              // context tu artinya mau ditampilin di  widget tree mana, di BuildContext context yg ini.
              builder: (context) {
                // ini ngebuild nya, isi parameter (context dari showDialog (context yg kiri))
                return AlertDialog(
                  content: Text('Hello, ${_controller.text}'),
                ); // basic model popup (AlertDialog)
              },
            );
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latihan Flexible',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [ // flex bisa diatur (contoh: flex:1 dan flex:2) maka container ke 2 lebih panjang
                  Icon(Icons.settings), // dari icon sampe container doang adalah contoh expanded
                  Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Text('Expanded'),
                      )
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Text('Rest of Expanded'),
                  ),
                  // Flexible(
                  //   fit: FlexFit.tight, // dia kayak expanded, makan ruang yg kosong
                  //   // fit: FlexFit.loose, // dia cuma make jumlah ruang yg seharusnya dia punya aja
                  //   child: Container(
                  //     color: Colors.tealAccent,
                  //     child: Text(
                  //       'Flexible 1',
                  //     ), // disini dia ga ngelebihin batasnya dia, masih ngasih space untuk widget lain
                  //   ),
                  // ),
                  // Flexible(
                  //   child: Container(
                  //     color: Colors.tealAccent,
                  //     child: Text('Flexible 2'),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SWITCH BUTTON - INPUT

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isLightMode,
      onChanged: (bool status) {
        setState(() {
          isLightMode = status;
        });
      },
      title: Text(isLightMode ? 'Light Mode' : 'Dark Mode'),
      secondary: Icon(isLightMode ? Icons.wb_sunny : Icons.nights_stay),
    );
  }
}

// RADIO BUTTON - INPUT

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: language,
      onChanged: (String? choice) {
        setState(() {
          language = choice;
          showSnackbar();
        });
      },
      child: const Column(
        children: [
          RadioListTile(value: 'Dart', title: Text('Dart')),
          RadioListTile(value: 'Kotlin', title: Text('Kotlin')),
          RadioListTile(value: 'Swift', title: Text('Swift')),
        ],
      ),
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

// CHECKBOX - INPUT

class HobbyItem {
  final String title;
  final bool isChecked;

  const HobbyItem({required this.title, this.isChecked = false});

  HobbyItem copyWith({String? title, bool? isChecked}) {
    return HobbyItem(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  final List<HobbyItem> _hobbies = [
    const HobbyItem(title: 'Reading'),
    const HobbyItem(title: 'Traveling'),
    const HobbyItem(title: 'Coding'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select Your Hobbies:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ..._hobbies.map((hobby) {
          // ... tu supaya isi dari map ga di dalem areanya [] sendiri tapi sejajar sama parentnya
          // ubah ListTile menjadi CheckboxListTile
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            // memindahkan posisi checkbox ke kiri title
            title: Text(hobby.title),
            value: hobby.isChecked,
            onChanged: (bool? value) {
              setState(() {
                final index = _hobbies.indexOf(hobby);
                _hobbies[index] = hobby.copyWith(isChecked: value ?? false);
              });
              showSnackbar();
            },
          );
        }),
      ],
    );
  }

  void showSnackbar() {
    final message = _hobbies
        .where((hobby) => hobby.isChecked)
        .map((hobby) => hobby.title)
        .join(', ');
    final text = message.isEmpty
        ? 'No hobbies selected'
        : 'Selected hobbies: $message';
    final scaffoldMessager = ScaffoldMessenger.of(context);
    scaffoldMessager
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(text)));
  }
}

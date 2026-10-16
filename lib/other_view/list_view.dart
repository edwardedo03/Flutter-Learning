import 'package:flutter/material.dart';

class ContohSingleChildScrollView extends StatelessWidget {
  const ContohSingleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text('1', style: TextStyle(fontSize: 50)),
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text('2', style: TextStyle(fontSize: 50)),
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text('3', style: TextStyle(fontSize: 50)),
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: const Center(
                child: Text('4', style: TextStyle(fontSize: 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Best Practice buat list tampilan pake ListView, tapi ListView langsung load seluruh data, meskipun masih belum tampil (pake ketika data sedikit)
class ContohListView extends StatelessWidget {
  const ContohListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Pengaturan Profil'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => print('Klik Profile'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text('Notifikasi'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => print('Klik Notifikasi'),
          ),
        ],
      ),
    );
  }
}

// ListView.Builder cocok untuk nampilin list data yang sudah pasti/banyak
class ContohListViewBuilder extends StatelessWidget {
  const ContohListViewBuilder({super.key});

  final List<String> contactList = const <String>[
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          // context disini buat ngasih tau widget dia di parent mana?
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text("$index"),
            ),
            title: Text(contactList[index]),
            subtitle: Text("Nama teman ke $index"),
            onTap: () {
              print("Anda menghubungi ${contactList[index]}");
            },
          );
        },
      ),
    );
  }
}

// Sama aja kayak builder tapi ada garisnya, bisa di akalin ga hanya garis tapi contohnya iklan
class ContohListViewSeparated extends StatelessWidget {
  const ContohListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text('Berita hari ini ke $index'),
          leading: Icon(Icons.article),
          onTap: () {
            print("Berita ke $index");
          },
        ),
        separatorBuilder: (context, index) {
          // contoh ada iklannya
          if ((index + 1) % 10 == 0) {
            return Container(
              height: 100,
              color: Colors.amber[100],
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Center(
                child: Text(
                  "Iklan",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return Divider(height: 1, color: Colors.black, indent: 30);
          }
        },

        // Divider(height: 1, color: Colors.black, indent: 50),
        itemCount: 50,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String email;

  const Info({super.key, required this.email});

  String _getNameFromEmail(String email) {
    if (email == 'astuti@gmail.com') {
      return 'Astuti Nur Aprilia';
    }
    return 'Pengguna Tidak Dikenal';
  }

  @override
  Widget build(BuildContext context) {
    final String username = _getNameFromEmail(email);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: const NetworkImage(
                'https://i.pinimg.com/564x/d2/31/d8/d231d8222688d7a702e0a8255a3f65b1.jpg',
              ),
              onBackgroundImageError: (_, __) => const Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat datang, $username!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Berikut adalah informasi akun Anda.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoItem(
                      label: 'Email',
                      value: email,
                    ),
                    const Divider(),
                    InfoItem(
                      label: 'Nama',
                      value: username,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

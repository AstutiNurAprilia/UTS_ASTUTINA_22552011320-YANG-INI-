import 'package:flutter/material.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> books = [
      {
        'title': 'The Kremlin School of Negotiation',
        'author': 'Igor Ryzov',
        'image': 'TKSON.png',
        'description':
            'The Kremlin School of Negotiation karya Igor Ryzov adalah panduan lengkap untuk menguasai teknik negosiasi. Buku ini menggabungkan metode resmi Kremlin yang muncul di Rusia pada tahun 1920-an dengan pengalaman bisnis Ryzov yang luas. Dalam satu paragraf, buku ini menawarkan strategi negosiasi efektif, tips memahami perilaku lawan bicara, cara meredakan ketegangan, serta contoh dan latihan praktis untuk mengasah keterampilan negosiasi, menjadikan pembaca lebih percaya diri dan sukses dalam situasi negosiasi apa pun.'
      },
      {
        'title': '48 Laws of Power',
        'author': 'Robert Greene',
        'image': '48P.png',
        'description':
            '48 Laws of Power karya Robert Greene adalah panduan tentang bagaimana memperoleh, mempertahankan, dan melindungi kekuasaan dalam dunia yang kompetitif. Buku ini terdiri dari 48 hukum yang diambil dari contoh sejarah dan strategi tokoh-tokoh yang berpengaruh, seperti Machiavelli dan Sun Tzu. Setiap hukum memberikan saran praktis dan taktik untuk mengendalikan situasi dan orang-orang di sekitar kita. Meski beberapa hukum mungkin dianggap manipulatif, buku ini memberikan wawasan berharga tentang dinamika kekuasaan.'
      },
      {
        'title': 'The Psychology of Money',
        'author': 'Morgan Housel',
        'image': 'PM.png',
        'description':
            'The Psychology of Money oleh Morgan Housel adalah buku yang mengeksplorasi bagaimana faktor-faktor emosional dan bias pribadi mempengaruhi keputusan keuangan kita. Dengan menyajikan 19 cerita pendek tentang cara orang berpikir tentang uang, Housel membantu kita memahami topik penting ini lebih baik dan membuat keputusan keuangan yang lebih bijak.'
      },
      {
        'title': 'Atomic Habits',
        'author': 'James Clear',
        'image': 'AH.png',
        'description':
            'Atomic Habits oleh James Clear adalah panduan tentang cara membangun kebiasaan baik dan menghentikan kebiasaan buruk melalui perubahan kecil yang konsisten. Buku ini mengajarkan prinsip-prinsip dasar pembentukan kebiasaan, serta menawarkan strategi praktis untuk mencapai perubahan positif yang bertahan lama.'
      },
      {
        'title': 'Bicara Itu Ada Seninya',
        'author': 'Oh Su-hyang',
        'image': 'BIAS.png',
        'description':
            'Bicara Itu Ada Seninya oleh Oh Su Hyang adalah buku tentang teknik komunikasi yang efektif. Buku ini membahas bagaimana berbicara dengan baik dapat menggetarkan hati pendengar dan meningkatkan keterampilan komunikasi untuk tujuan persuasi dan negosiasi. Oh Su Hyang, seorang pakar komunikasi dari Korea Selatan, menawarkan tips dan contoh nyata untuk meningkatkan keterampilan berbicara, termasuk pentingnya bahasa tubuh dan nada suara.'
      },
      {
        'title': 'The Alpha Girls Guide',
        'author': 'Henry Manampiring',
        'image': 'TAGG.png',
        'description':
            'The Alpha Girls Guide oleh Henry Manampiring adalah buku self-development yang membantu remaja dan perempuan muda untuk menjadi lebih cerdas, percaya diri, dan independen. Buku ini memberikan tips tentang nilai vs pengalaman berorganisasi, teman sejati, mengetahui cowok parasit, bersikap saat patah hati, pernikahan dengan alasan yang tepat, dan hal-hal penting saat memulai bekerja. Ditulis dengan gaya ringan, penuh ilustrasi kocak, tetapi tetap blak-blakan, buku ini juga berisi wawancara inspiratif dengan Najwa Shihab dan Alanda Kariza.'
      },
    ];

    void showBookDetails(BuildContext context, Map<String, String> book) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: book['image']!.contains('http')
                        ? Image.network(
                            book['image']!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'image/${book['image']!}',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Author: ${book['author']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book['description']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => showBookDetails(context, books[index]),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: books[index]['image']!.contains('http')
                        ? Image.network(
                            books[index]['image']!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'image/${books[index]['image']!}',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        books[index]['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        books[index]['author']!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

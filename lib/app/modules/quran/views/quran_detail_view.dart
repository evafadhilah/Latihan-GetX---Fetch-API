import 'package:flutter/material.dart';
import 'package:rpl1getx/app/data/models/quran.dart';

class QuranDetailView extends StatelessWidget {
  final Quran surah;

  const QuranDetailView({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nama ?? ''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asma: ${surah.asma}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Arti: ${surah.arti}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Jumlah Ayat: ${surah.ayat}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Jenis: ${surah.type}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Keterangan: ${surah.keterangan}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/quran/controllers/quran_controller.dart';
import 'quran_detail_view.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Al-Qur\'an')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchSurah,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final quranList = controller.quranList;
        if (quranList.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: quranList.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final surah = quranList[i];
            return ListTile(
              leading: CircleAvatar(
                child: Text(surah.nomor?.toString() ?? '-'),
              ),
              
              title: Text(surah.nama ?? ''),
              subtitle: Text(surah.arti ?? ''),
              trailing: Text(surah.type ?? ''),
              onTap: () => Get.to(() => QuranDetailView(surah: surah)),
            );
          },
        );
      }),
    );
  }
}

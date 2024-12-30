import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/api_service.dart';

class ApiController extends GetxController {
  final ApiService _apiService = ApiService();

  // Obx states
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  // Fungsi untuk fetch data
  Future<void> fetchPosts() async {
    isLoading(true);
    try {
      await _apiService.fetchPosts();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diambil!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data: $e');
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk create post
  Future<void> createPost() async {
    isLoading(true);
    try {
      await _apiService.createPost();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil ditambahkan!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambah data: $e');
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk update post
  Future<void> updatePost() async {
    isLoading(true);
    try {
      await _apiService.updatePost(1); // Pastikan ID disesuaikan
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diperbarui!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal memperbarui data: $e');
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk delete post
  Future<void> deletePost() async {
    isLoading(true);
    try {
      await _apiService.deletePost(1); // Pastikan ID disesuaikan
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil dihapus!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e');
    } finally {
      isLoading(false);
    }
  }
}

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController controller = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.posts.isEmpty) {
                return const Text(
                  "Tekan tombol GET untuk mengambil data",
                  style: TextStyle(fontSize: 12),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            controller.posts[index]['title'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          subtitle: Text(
                            controller.posts[index]['body'] ?? '',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.createPost(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () => controller.fetchPosts(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () => controller.updatePost(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: () => controller.deletePost(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

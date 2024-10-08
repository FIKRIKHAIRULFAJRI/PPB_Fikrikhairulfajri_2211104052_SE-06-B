import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write("Masukkan tinggi piramida: ");
  int? n = int.tryParse(stdin.readLineSync()!);

  if (n != null && n > 0) {
    // Memastikan input valid dan tinggi piramida lebih dari 0
    // Membuat piramida
    for (int i = 1; i <= n; i++) {
      // Cetak spasi untuk membuat piramida terpusat
      for (int j = 1; j <= n - i; j++) {
        stdout.write(" ");
      }
      // Cetak bintang pada setiap baris
      for (int k = 1; k <= 2 * i - 1; k++) {
        stdout.write("*");
      }
      // Pindah ke baris berikutnya
      print("");
    }
  } else {
    print("Input tidak valid, masukkan angka lebih dari 0.");
  }
}

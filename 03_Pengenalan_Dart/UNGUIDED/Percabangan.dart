import 'dart:io';

// Fungsi untuk menentukan nilai berdasarkan kondisi yang diberikan
String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Jika nilai tidak memenuhi semua kondisi di atas, return teks kosong
  }
}

void main() {
  // Menerima input dari user
  stdout.write("Masukkan nilai: ");
  int? nilai = int.tryParse(stdin.readLineSync()!);

  // Memastikan input adalah angka dan tidak null
  if (nilai != null) {
    // Memanggil fungsi cekNilai untuk mendapatkan hasil
    String hasil = cekNilai(nilai);

    // Memeriksa apakah hasil tidak kosong
    if (hasil.isNotEmpty) {
      print("$nilai merupakan $hasil");
    } else {
      print("Nilai tidak valid.");
    }
  } else {
    print("Input tidak valid, harap masukkan angka.");
  }
}

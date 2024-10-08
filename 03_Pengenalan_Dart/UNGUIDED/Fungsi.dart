import 'dart:io';

// Fungsi untuk mengecek apakah suatu bilangan adalah bilangan prima
bool cekPrima(int n) {
  if (n <= 1) {
    return false; // Bilangan <= 1 bukan bilangan prima
  }

  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false; // Jika ada pembagi selain 1 dan n, maka bukan bilangan prima
    }
  }
  return true; // Jika tidak ada pembagi, maka bilangan prima
}

void main() {
  // Menerima input dari user
  stdout.write("Masukkan bilangan bulat: ");
  int? angka = int.tryParse(stdin.readLineSync()!);

  // Memeriksa apakah input valid
  if (angka != null) {
    // Memanggil fungsi cekPrima untuk menentukan apakah bilangan prima atau bukan
    if (cekPrima(angka)) {
      print("$angka merupakan bilangan prima");
    } else {
      print("$angka bukan bilangan prima");
    }
  } else {
    print("Input tidak valid, harap masukkan bilangan bulat.");
  }
}

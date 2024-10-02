
// // Fixed List
//void main() {
   //List<int> fixedList = List.filled(3, 0);

   //fixedList[0] = 10;
   //fixedList[1] = 20;
   //fixedList[2] = 30;

   //print('Fixed length list; $fixedList');
//}

void main() {
// Membuat growable list (panjangnya bisa berubah)
  List<int> growableList = [];
// Menambahkan elemen baru ke dalam list
  growableList.add(10);
  growableList.add(20);
  growableList.add(30);

  print(growableList);
// Menambahkan lebih banyak elemen
  growableList.add(50);
  growableList.add(70);
  growableList.add(90);
  print(growableList); // Output: [10, 20, 30, 40, 50]
}

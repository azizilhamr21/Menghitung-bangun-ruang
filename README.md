# Menghitung-bangun-ruang

Pada aplikasi ini, bagian yang paling penting adalah proses perhitungan volume untuk tiga bangun ruang, yaitu kubus, tabung, dan kerucut. Perhitungan dilakukan setelah pengguna memasukkan angka ke dalam kolom input, lalu menekan tombol “Hitung”

Untuk kubus, rumus yang digunakan adalah V = s³, di mana s adalah panjang sisi. Di dalam kode, nilai sisi diambil dari input pengguna, lalu dihitung menggunakan fungsi pow(s, 3) yang berarti sisi dipangkatkan tiga. Hasilnya kemudian disimpan ke dalam variabel hasil. Setelah itu, fungsi setState() dipanggil supaya tampilan langsung diperbarui dan hasil volume bisa muncul di layar.

Untuk tabung, rumus yang digunakan adalah V = πr²t, di mana r adalah jari-jari dan t adalah tinggi. Program mengambil nilai jari-jari dan tinggi dari dua kolom input yang berbeda. Nilai jari-jari dipangkatkan dua menggunakan pow(r, 2), lalu dikalikan dengan nilai π (pi dari dart:math) dan dikalikan lagi dengan tinggi. Hasil perhitungan ini kemudian ditampilkan ke layar setelah setState() dijalankan.

Sedangkan untuk kerucut, rumusnya adalah V = 1/3 × πr²t. Cara menghitungnya hampir sama dengan tabung, hanya saja hasilnya dikalikan dengan 1/3 karena volume kerucut memang sepertiga dari volume tabung dengan jari-jari dan tinggi yang sama. Program mengambil nilai jari-jari dan tinggi, menghitung πr²t, lalu mengalikannya dengan 1/3. Setelah itu, hasilnya diperbarui di tampilan menggunakan setState().

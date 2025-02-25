import 'dart:ui';
import 'package:appm1/anime.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Anime anime;
  const DetailPage({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background hitam
      appBar: AppBar(
        title: Text(
          anime.judul,
          style: const TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Tombol back putih
      ),
      body: ListView(
        children: [
          // Gambar header dengan efek blur
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(anime.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), // Efek gelap pada gambar
                  BlendMode.darken,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Center(
                child: Image.asset(anime.image, width: 130),
              ),
            ),
          ),

          // Judul Anime
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                anime.judul,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
          ),

          // Informasi (Studio, Episode, Rating dengan ikon bintang)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              animeInfo(anime.studio.toString(), "Studio"),
              animeInfo(anime.episode.toString(), "Episode"),
              animeRating(anime.rate.toString()), // Menggunakan fungsi khusus untuk rating dengan ikon bintang
            ],
          ),

          // Deskripsi
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Tambah padding agar lebih ke tengah
            child: Text(
              "Description",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Warna teks putih
              ),
            ),
          ),
          
          // Sinopsis dengan teks rata kanan-kiri
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: animeSip(anime.sinopsis),
          ),
        ],
      ),
    );
  }

  Widget animeInfo(String value, String info) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Warna teks putih
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white70, // Warna teks putih agak redup
          ),
        )
      ],
    );
  }

  // Fungsi khusus untuk menampilkan rating dengan ikon bintang ⭐
  Widget animeRating(String rating) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star, // Ikon bintang
              color: Colors.yellow, // Warna kuning
              size: 22,
            ),
            const SizedBox(width: 5), // Jarak kecil antara ikon dan teks
            Text(
              rating,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Warna teks putih
              ),
            ),
          ],
        ),
        const Text(
          "Rating",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white70, // Warna teks putih agak redup
          ),
        ),
      ],
    );
  }

  Widget animeSip(String sip) {
    return Text(
      sip,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white, // Warna teks putih
      ),
      textAlign: TextAlign.justify, // Membuat teks rata kanan-kiri
    );
  }
}

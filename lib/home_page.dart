import 'package:appm1/book.dart';
import 'package:appm1/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("AniListic"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "data", 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Image.asset("images/banner.png", 
                  width: 100,
                  )
              ],
            ),
            //teks buku
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Anime Rekomendation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ),

            //list buku
            ListView.builder(
              itemCount: listBook.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                final book = listBook[index];
                return GestureDetector(
                  onTap: (){
                    //berpindah halaman
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => DetailPage(book: book),
                        ),
                        );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(book.image, width: 64,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.name,
                              style: const TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.w500),
                              ),
                            Text(
                              book.categoryBook,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          ],
        ),
        ),
      ),
    );
  }
}
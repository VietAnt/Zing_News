import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zingvn/models/article.dart';
import 'package:zingvn/screen/article_view.dart';

Widget MyAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center, //-nam giua--//
      children: const [
        Text(
          'Zing',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          'News',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, content, portUrl;
  const NewsTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.content,
      required this.portUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(portUrl: portUrl)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 10),
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

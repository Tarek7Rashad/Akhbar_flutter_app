import 'package:flutter/material.dart';

Widget buildArticleItem(article) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: article['urlToImage'] != null
                    ? NetworkImage("${article['urlToImage']}")
                    : const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQulVpB9YDxnnJBgPdrm5Rc5x6xmJH0xO1FYihUJpEiDSvHEOgSBSHnADEC-NLfeIQ-vos&usqp=CAU',
                      ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${article['title']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  '${article['description']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
              ],
            ),
          )
        ],
      ),
    );

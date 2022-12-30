import 'package:flutter/material.dart';

Size? size;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('메인 페이지'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: size!.height * .95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Column(
              children: [
                const Text('회원 관리 (Authentication)'),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/auth'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    // minimumSize: Size.fromWidth(size!.width * .8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('바로 가기'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('데이터베이스 CRUD (Cloud Firestore)'),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    // minimumSize: Size.fromWidth(size!.width * .8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('바로 가기'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('이미지 저장 (Storage)'),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    // minimumSize: Size.fromWidth(size!.width * .8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('바로 가기'),
                  ),
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

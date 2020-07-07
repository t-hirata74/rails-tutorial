#　つまったやつ
https://qiita.com/kenjinnnn/items/2572f96900981e0437da
https://qiita.com/KenAra/items/2708ce3d5c80c4f24920
https://qiita.com/harapeko-wolf/items/2d49b3ec0d3f6fd7ac98
https://blog.toshimaru.net/rails-on-docker-compose/#%E5%88%9D%E6%9C%9Fgemfile

# メモ
・DBはMysqlだとherokuへのデプロイがうまくいかないそうなので、postgresにする
→そんなことはなかった
・DBのポートが3306だと既存の別アプリと競合しちゃうのでdocker-compose.ymlで3307にしておく
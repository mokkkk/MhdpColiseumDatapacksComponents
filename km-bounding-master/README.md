# km-bounding
Minecraft JEのコマンドでエンティティが図形の範囲内にいるかの判定を行うライブラリデータパックです。\
Library data pack for determining whether an entity’s position is inside a given shape.

## 対応バージョン / Verified mc versions
Minecraft Java Edition 1.21.2~

## 対応図形 / Shapes
- 直方体：cuboid
- 円柱：cylinder
- 扇形柱・ケーキ型：cake
- 円錐：cone
- 平面：plane（if function用）

## 使用例 / How To Use
引数ストレージに値を設定してから、ファンクションを呼び出すと、範囲内のエンティティにタグが付けられます。\
When you set values in the argument storage and then call the function, entities within the specified range will be tagged.

```mcfunction
# 引数設定 / Set arguments
data modify storage km_bounding: arguments.cuboid set value {selector:"@e[type=armor_stand,distance=..10]",x_plus:3,y_plus:3,z_plus:3.0,x_minus:3.0,y_minus:3.0,z_minus:3.0}

# 関数実行 / Run function
execute as @p at @s run function km_bounding:cuboid/

# タグ利用 / Search for entities using tags.
say @e[tag=bounding_cuboid]

# タグ削除 / Remove tags
tag @e[tag=bounding_cuboid] remove bounding_cuboid
```

## 引数 結果/ Arguments Output
各ファンクション内のドキュメントからも確認できます。

### 直方体：cuboid
#### 引数
| 要求データ | 型 | 説明 |
| :---------------- | :----- | :------------------------------- |
| 実行位置 | position | 基準点 |
| 実行向き | rotation | 直方体の向き |
| arguments.cuboid.selector | string | 判定対象とするエンティティのセレクタ |
| arguments.cuboid.x_plus | double | 基準点からX+方向への大きさ |
| arguments.cuboid.y_plus | double | 基準点からY+方向への大きさ |
| arguments.cuboid.z_plus | double | 基準点からZ+方向への大きさ |
| arguments.cuboid.x_minus | double | 基準点からX-方向への大きさ |
| arguments.cuboid.y_minus | double | 基準点からY-方向への大きさ |
| arguments.cuboid.z_minus | double | 基準点からZ-方向への大きさ |
#### 結果
範囲内のエンティティにタグ`bounding_cuboid`を付与する。

### 円柱：cylinder
#### 引数
| 要求データ | 型 | 説明 |
| :---------------- | :----- | :------------------------------- |
| 実行位置 | position | 基準点（円の中心） |
| arguments.cylinder.selector | string | 判定対象とするエンティティのセレクタ |
| arguments.cylinder.radius | double | 円柱の半径 |
| arguments.cylinder.y_plus | double | 基準点から円柱の天面までの距離 |
| arguments.cylinder.y_minus | double | 基準点から円柱の底面までの距離 |
#### 結果
範囲内のエンティティにタグ`bounding_cylinder`を付与する。

### 扇形柱・ケーキ型：cake
#### 引数
| 要求データ | 型 | 説明 |
| :---------------- | :----- | :------------------------------- |
| 実行位置 | position | 基準点（扇型の中心） |
| 実行向き | rotation | 基準向き（横向きのみ反映） |
| arguments.cake.selector | string | 判定対象とするエンティティのセレクタ |
| arguments.cake.radius | double | 扇型柱の半径 |
| arguments.cake.y_plus | double | 基準点から扇型柱の天面までの距離 |
| arguments.cake.y_minus | double | 基準点から扇型柱の底面までの距離 |
| arguments.cake.angle_plus | double | 基準向きからプラス方向の扇型の角度 |
| arguments.cake.angle_minus | double | 基準向きからマイナス方向の扇型の角度 |
#### 結果
範囲内のエンティティにタグ`bounding_cake`を付与する。

### 円錐：cone
#### 引数
| 要求データ | 型 | 説明 |
| :---------------- | :----- | :------------------------------- |
| 実行位置 | position | 円錐の頂点 |
| 実行向き | rotation | 基準向き（Y軸向きのみ反映） |
| arguments.cake.selector | string | 判定対象とするエンティティのセレクタ |
| arguments.cake.radius | double | 扇型柱の半径 |
| arguments.cake.y_plus | double | 基準点から扇型柱の天面までの距離 |
| arguments.cake.y_minus | double | 基準点から扇型柱の底面までの距離 |
| arguments.cake.angle_plus | double | 基準向きからプラス方向の扇型の角度 |
| arguments.cake.angle_minus | double | 基準向きからマイナス方向の扇型の角度 |
#### 結果
範囲内のエンティティにタグ`bounding_cone`を付与する。

### 平面：plane
#### 引数
| 要求データ | 型 | 説明 |
| :---------------- | :----- | :------------------------------- |
| 実行位置 | position | 面が通る点 |
| 実行向き | rotation | 面の向き |
#### 結果
ファンクションの戻り値で成否を返す。

## 注意点
このライブラリの導入にあたって以下の点にご留意ください。\
オーバーワールドの[0,0]チャンクをforceloadします。\
314-0-3bd-0-161というUUIDの計算用マーカエンティティが原点に存在します。killしたり移動させたりしないでください。

## ライセンス
These codes are released under the MIT License, see LICENSE.

## 連絡先 / Contact
不具合や要望などがあればXまでご連絡ください。
https://x.com/komaramune

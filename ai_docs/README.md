# ai_docs — モンスターデータパック関連ドキュメント

`mhdp_monster_valk`(天彗龍)を新形式へ更新する作業のために作成した資料群。

## ファイル一覧

| ファイル | 内容 |
| --- | --- |
| [`monster_datapack_spec.md`](./monster_datapack_spec.md) | **新形式 `mhdp_monster_xxx` データパックの作成手順書 / 共通ファイル仕様書**。更新後のデータパックにどのような共通ファイルが存在し、各処理が何をするのかを記述する。AI がこの手順書を参照して新形式のデータパックを組み立てる。 |
| [`monster_datapack_comparison.md`](./monster_datapack_comparison.md) | **新形式 2 種（`mhdp_monster_dino` / `mhdp_monster_ranposu`）と旧形式 `mhdp_monster_valk` の仕様比較表**。どこを・どのように変えれば valk が新形式になるかの差分一覧。 |

## 参照した実データパック

- 新形式リファレンス: `datapacks/mhdp_monster_dino`（Uid 1003 / グラビモス系「斬竜」）、`datapacks/mhdp_monster_ranposu`（Uid 1001 / 「青鳥竜」）
- 更新対象（旧形式）: `datapacks/mhdp_monster_valk`（Uid 1004 / 「天彗龍」）
- 共通エンジン: `datapacks/mhdp_core/data/mhdp_monsters/`（名前空間 `mhdp_monsters`）
- 旧形式の別例: `datapacks/mhdp_monster_reus`、`datapacks/mhdp_core_dummy_monsters/data/mhdp_monster_karakuri`（部分移行済み）

## 用語

- **データパック**: 直下に `data/` フォルダと `pack.mcmeta` を必ず持つ特定構造のフォルダ。主に `.mcfunction` で構成される。フォルダ名がそのままデータパック名。
- **新形式**: 共通エンジン `mhdp_monsters` の `core/super/*` / `core/switch/*` / `core/util/*` にロジックを委譲し、モンスター固有パックは「フェーズ別 tick」「行動選択」「アニメーションイベント」だけを持つ構成。`dino` / `ranposu` が該当。
- **旧形式**: `pack_format` 指定が古く（81）、`#minecraft:load` / `#minecraft:tick` タグを持ち、共通処理を旧 `mhdp_monsters:core/util/tick/tick` 一枚に依存している構成。`valk` / `reus` が該当。
- **AJ**: Animated Java。blueprint（`.ajblueprint`）から `data/animated_java_<name>/` 以下のモデル/アニメーション制御関数を自動生成するツール。手書き禁止・再エクスポートで上書きされる。

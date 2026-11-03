# 新形式モンスター データパック 共通テンプレート

`mhdp_monster_template/` は、dino / ranposu / valk に共通する処理を抜き出したテンプレート。
新しいモンスターを作るときは、これを `datapacks/mhdp_monster_<name>/` に展開してから固有部分を書き足す。

- 拡張子は `*.tmpl`。サーバーや Spyglass がデータパックとして読み込まないよう、`ai_docs` 配下に置いている。
- ベースは valk（最新の移行で整備済み）。値（発見距離・加算値など）は dino のもの。
- 各ファイルが何をするかは [`monster_datapack_spec.md`](../../monster_datapack_spec.md) §3 を参照。
- 初版は `mhdp_monster_reus` 作成時（2026-10-25）に作成。経緯は [`../reus/creation_plan.md`](../reus/creation_plan.md)。

## 展開手順

1. `mhdp_monster_template/` を `datapacks/mhdp_monster_<name>/` にコピーし、`.tmpl` を外す。フォルダ名の `mhdp_monster_{{name}}` も置き換える。
2. 下表のプレースホルダを置き換える。
3. 繰り返しブロック（`{{#parts}}…{{/parts}}` など）を、部位・技の数だけ展開する。
4. ファイル名にプレースホルダがあるもの（`{{part}}` / `{{range}}`）は、部位・距離帯ごとに 1 ファイルずつ作る。
5. 改行コードを CRLF にそろえ、`grep -rnP '\S  +\S'`（コメント行を除く）でトークン間の連続スペースが無いことを確認する。

## プレースホルダ

### 名前・データ

| プレースホルダ | 意味 | 例（reus） |
| --- | --- | --- |
| `{{name}}` | 小文字 prefix。データパック名・AJ 名前空間・モデル名 | `reus` |
| `{{Upper}}` | パスカルケース。タグ・スコア | `Reus` |
| `{{uid}}` | Uid | `1002` |
| `{{display_name}}` | 日本語表示名（コメント・`#declare`） | `火竜` |
| `{{pack_desc}}` | `pack.mcmeta` の description 用英名 | `Rathalos` |
| `{{icon}}` / `{{name_id}}` / `{{show_name}}` / `{{loot_table}}` | MonsterData の表示系。`{{show_name}}` はテキストコンポーネント | `uE012` / `monster.rathalos.name` / `{"translate":"monster.rathalos.name"}` / `mhdp_items:materials/reus/random_all` |
| `{{Hp}}` ほか MonsterData の各値 | `register` のステータス（spec §4.1） | dino の値 |

### 部位（`{{#parts}}` の中、および `{{part}}` ファイル）

| プレースホルダ | 意味 | 例 |
| --- | --- | --- |
| `{{Part}}` | パスカルケース部位名（タグ・スコア・`<Part>PartDamage`） | `Head`, `LegR` |
| `{{part}}` | 小文字部位名（ファイル名・AttackPart） | `head`, `leg_r` |
| `{{part_id}}` | DefenceData の行 index | `0` |
| `{{part_ja}}` | 日本語部位名（コメント） | `頭` |
| `{{part_damage}}` | `<Part>PartDamage`（%） | `12` |
| `{{defence}}` | 肉質 `[切,打,弾,火,水,雷,氷,龍]` | `[70,75,62,0,15,25,10,30]` |
| `{{anim.damage_part}}` | その部位の怯みアニメ | `damage_head` |
| `{{#breakable}}` / `{{#breakable_parts}}` | 部位破壊する部位だけ展開 | |
| `{{break_count}}` | 何回怯ませると破壊するか | `1` |
| `{{#cut}}` | 切断する部位だけ展開（`Mns.Break.<Part>.Cut` を付ける） | 尻尾 |

### アニメーション・ノード

| プレースホルダ | 用途 |
| --- | --- |
| `{{anim.idle_relax}}` / `{{anim.idle}}` | 非戦闘 / 戦闘の待機 |
| `{{anim.walk_relax}}` | 非戦闘の歩き |
| `{{anim.ecology}}` / `{{anim.ecology_long}}` | 生態行動（短 / 長） |
| `{{anim.search}}` / `{{anim.voice}}` / `{{anim.anger}}` | 探索 / 咆哮 / 怒り移行 |
| `{{anim.turn_l}}` / `{{anim.turn_r}}` | 旋回 |
| `{{anim.damage_head}}` / `{{anim.damage_l}}` / `{{anim.damage_r}}` | 不意打ち（ambush）の怯み |
| `{{anim.damage_counter}}` | 相殺怯み |
| `{{anim.damage_down_l}}` / `{{anim.damage_down_r}}` | スタン時のダウン |
| `{{anim.paralysis}}` / `{{anim.death}}` | 麻痺 / 討伐 |
| `{{blink_node}}` | まばたきで差し替える頭部ノード（例 `head_upper`） |
| `{{locator.anger}}` / `{{effect_anger_particle}}` | 怒り演出のロケータ（`pos_` 始まり）/ パーティクル 1 行 |

### 行動選択（`on_battle/{{range}}`・`macro/m.{{range}}`）

| プレースホルダ | 意味 |
| --- | --- |
| `{{range}}` / `{{range_ja}}` | 距離帯 `move` / `near` / `middle` / `far` |
| `{{dist.near}}` / `{{dist.middle}}` | 距離帯の境界（dino: 12 / 25） |
| `{{weights}}` | `Temp.AttackRandom` の中身（`技名:重み,…`）。外側の `{}` は NBT の括弧 |
| `{{#attacks}}` / `{{Attack}}` / `{{attack_id}}` / `{{attack_ja}}` | 技ごとの繰り返し。`attack_id` は 1 から連番で、`m.{{range}}` の `Id` と一致させる |
| `{{#is_move}}` | `move` のときだけ展開（張り付き対策の回数リセット） |

## テンプレートに含めていないもの

- `core/tick/animation/event/<anim>/*`（アニメーションごとに固有）
- `core/util/models/*`（モデル差し替え。**ただし `anger_end` だけは必須なので含めている**）
- `core/util/phase/*`（固有の部位状態）
- 技・弾 / VFX object・建築物相互作用の固有処理（`interact/reaction/*`、`on_search_object`）

## 展開時に守ること

- **存在しない関数を呼ぶ行を残さない。** 通常の関数は、呼び先が無いとそのファイル自体が読み込まれず、呼び出し元まで連鎖して動かなくなる。`event/main` の各行や `break/{{part}}` のモデル差し替えは、呼び先を作るまでコメントアウトしておく。
- **`core/util/models/anger_end` は必須。** 共通エンジンの `end_anger.m` がマクロで必ず呼ぶ。無いと `end_anger.m` 全体の実行が失敗し、怒りが解除されない。
- **マクロ行（`$` 始まり）は `$(...)` を最低 1 つ含む必要がある。** 技が 1 つも無い距離帯では `macro/m.{{range}}` を作らず、`on_battle/{{range}}` の「決定」〜「Animタグ付与」をコメントアウトして仮の行動（`Anim.Idle` など）を付ける。
- frame スコア・ロケータ・軸合わせ・地割れの書き方は `CLAUDE.md` の記述ルールに従う。

## 元の実装から直した点（流用元のバグ）

| 流用元 | 問題 | テンプレートでの扱い |
| --- | --- | --- |
| dino / ranposu `core/summon/intrusion` | 存在しない `core/summon/summon_init` を呼ぶ | valk 版（summon と同じ流れ）を採用 |
| dino `core/damage/reaction/paralysis` | ranposu からのコピーのままで、`animated_java_ranposu` のアニメを呼んでいる | `{{anim.paralysis}}` に置き換え |
| dino `core/tick/animation/change/main` | 戦闘時の判定が `Mns.Temp.IsAlreadyAnsimation`（誤字）になっていて常に真 | `Mns.Temp.IsAlreadyAnimation` に修正 |
| dino `change/on_battle/near` / `far` | `check_player_situation.m` の Tag が `Mns.Dino.Target`（存在しないタグ） | `Mns.Target.{{Upper}}` に修正 |
| 各モンスターの `@within` コメント | `mhdp_monsters:core/switch/macro/m.damage` のコピーが多い | 実際の呼び出し元に修正 |
| valk の `reaction/general`・`model_interrupt` 呼び出し | valk 固有 | 含めない（各 reaction の末尾は `tag @s add Mns.Temp.IsDamaged`） |

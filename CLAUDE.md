# CLAUDE.md

このファイルは、このリポジトリで作業する AI 向けのガイドです。

## モンスター生成の指示を受けた場合

ユーザからモンスターを生成するよう指示された場合は、まず `ai_docs/README.md` を参照し、そこに記載された手順・仕様に従うこと。

### 進行中の移行作業

- **`mhdp_monster_valk`（天彗龍）を旧形式 → 新形式へ移行中**。進捗トラッカー: `ai_docs/monster/valk/migration_progress.md`。
  セッションをまたいで再開する場合はこのトラッカーを起点にし、「次に着手」から継続すること。
  git commit はユーザーが手動で行う。Claude は commit すべきタイミングを通知するのみで、勝手に commit しない。

## AJ 生成フォルダは読み込まない

`animated_java/` および `animated_java_<name>/`（各モンスターの AJ エクスポート成果物）は **Read / Grep しない**。数千ファイル・巨大でコンテキストを圧迫する。
アニメの frame 番号等が必要なときは旧 `_bak` 側のロジック名前空間（`mhdp_monster_<name>_bak/data/mhdp_monster_<name>/`）の event ファイルを参照する。ボーン名・ロケータ名の確認が必要ならユーザーに質問する。

## .mcfunction 記述ルール

### コマンドトークン間の半角スペースは必ず 1 つ

`.mcfunction` のコマンド行では、トークン（引数）と引数の間の半角スペースは**必ず 1 つ**。
`run` の位置を縦にそろえる目的などでスペースを 2 つ以上連続させると **コンパイルエラー**になる。

```
# NG （max のあとにスペース2つ）
    execute store result bossbar mhdp_monster:valk max   run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:valk value run scoreboard players get @s Mns.Hp

# OK
    execute store result bossbar mhdp_monster:valk max run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:valk value run scoreboard players get @s Mns.Hp
```

- 行頭のインデント（階層表現のための連続スペース）は許容される。制約はあくまで**コマンドのトークン間**。
- `data modify ... value {\` の行継続内、NBT/JSON 内部の空白は対象外。
- コミット前に `grep -rnP '\S  +\S' <対象ディレクトリ>`（コメント行を除外）で確認すること。

### Animated Java ロケータの参照は `at_locator` / `as_locator` を使う

旧記法 `execute ... on passengers if entity @s[tag=aj.data] run function <fn> with entity @s data.locators.pos_xxx` は**現行 AJ では動作しない**。

新記法:
```
function animated_java_<name>:<name>/at_locator {name:"pos_xxx",command:"function <fn>"}
```
- `pos_` で始まるロケータ → `at_locator`（位置・回転がロケータ基準になる）
- それ以外のロケータ → `as_locator`
- `command` 内の関数はロケータの位置・回転で実行されるので、内部は `particle ... ^ ^ ^<offset>` のように相対座標で書く（マクロ `$(posx)` は不要）。
- `mhdp_monster_dino` の `core/tick/animation/event/*/main.mcfunction` が実例。

> 注意: `dino` / `ranposu` の既存コードには旧記法が残っている箇所がある（`effect_stun` など）。参考にしつつも、ロケータ参照は新記法へ直すこと。

### 軸合わせ（ターゲット方向への回転）は `alignment_start.m` / `alignment` を使う

旧記法（個別の `turn_start`/`turn_start_adjust.mcfunction` ファイル + `function mhdp_monsters:core/util/other/turn_to_target_rotate`）は使わず、`mhdp_monster_dino` 準拠の以下の形式で `main.mcfunction` に直接インラインで書く。

```
# 軸合わせ開始（frame単発）
execute if score @s aj.<anim>.frame matches <startFrame> run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.<Upper>",Tick:<YY>,MaxRotation:<ZZZ>}

# 軸合わせ実行（frame範囲、at @s 必須）
execute if score @s aj.<anim>.frame matches <range> at @s run function mhdp_monsters:core/util/tick/event/alignment
```

- `<Upper>` はモンスター名（例: `Valk`）。
- `<YY>`（Tick）は旧 `turn_start` 系ファイル内の `scoreboard players set #mhdp_temp_rotate_tick MhdpCore <値>` をそのまま流用する。弱め調整版（旧 `turn_start_adjust`）があればその値を別途 `alignment_start.m` 呼び出しとして残す。
- `<ZZZ>`（MaxRotation）は基本的に `180` とする。
- `alignment_start.m` の呼び出しには `at @s` を付けない。範囲呼び出しの `alignment` には `at @s` を付ける（dino の実例に厳密に合わせる）。
- 実例: `mhdp_monster_dino` の `core/tick/animation/event/tail_attack_r/main.mcfunction`、`bite_to_tail/main.mcfunction`。
- 以降のアニメーションイベント生成すべてに適用する。

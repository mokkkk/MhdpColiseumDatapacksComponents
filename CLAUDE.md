# CLAUDE.md

このファイルは、このリポジトリで作業する AI 向けのガイドです。

## モンスター生成の指示を受けた場合

ユーザからモンスターを生成するよう指示された場合は、まず `ai_docs/README.md` を参照し、そこに記載された手順・仕様に従うこと。

### 進行中の移行作業

- **`mhdp_monster_valk`（天彗龍）を旧形式 → 新形式へ移行中**。進捗トラッカー: `ai_docs/monster/valk/migration_progress.md`。
  セッションをまたいで再開する場合はこのトラッカーを起点にし、「次に着手」から継続すること。
  git commit はユーザーが手動で行う。Claude は commit すべきタイミングを通知するのみで、勝手に commit しない。

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

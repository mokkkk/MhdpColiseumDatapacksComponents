# 新形式 `mhdp_monster_xxx` データパック 作成手順書 / 共通ファイル仕様書

対象: 新形式のモンスターデータパック（リファレンス実装は `mhdp_monster_dino` と `mhdp_monster_ranposu`）。
本書は「更新後のデータパックにどのような共通ファイルがあるか」「それぞれの処理は何をするか」を規定する。
AI はこの手順書を参照して `mhdp_monster_<name>` データパックを構築する。

---

## 0. アーキテクチャ概要

### 0.1 データパックの物理構造

```
mhdp_monster_<name>/                 ← フォルダ名 = データパック名。<name> は英小文字
├── pack.mcmeta                      ← 必須
└── data/
    ├── mhdp_monster_<name>/         ← ★手書きするモンスターロジック名前空間
    │   ├── function/...
    │   └── advancement/toast_break.json
    └── animated_java_<name>/        ← AJ 自動生成（手書き禁止・再エクスポートで上書き）
        └── function/...
```

- `<name>` は英小文字（例: `dino`, `ranposu`, `valk`）。`UpperName` はパスカルケース（例: `Dino`, `Ranposu`, `Valk`）。
- AJ 名前空間は `animated_java_<name>`（`dino` → `animated_java_dino`）。
  例外: 旧 `valk` は共有名前空間 `animated_java` に `valk_aj` リグとして出力しているが、**新形式では必ず `animated_java_<name>` に分離する**。
- `data/minecraft/tags/function/` は原則不要。AJ が `load.json` / `tick_.json` を出力する場合はそれのみ（`animated_java:global/on_load` 等）。
  **モンスターロジック用の `#minecraft:load` / `#minecraft:tick` タグは作らない。**

### 0.2 `pack.mcmeta`

```json
{
	"pack": {
		"description": "For Monster <表示名>",
		"min_format": 107.1,
		"max_format": 107.1
	}
}
```

- `min_format` / `max_format` は他の新形式パック（dino / ranposu）と一致させる（現状 `107.1`）。
- 旧形式の `"pack_format": 81` は使わない。

### 0.3 共通エンジンとの関係

共通エンジンは `mhdp_core` データパック内の名前空間 **`mhdp_monsters`**。
モンスターデータパックはクエスト開始時に `datapack enable "file/mhdp_monster_<name>"` で動的にロードされ、終了時に `datapack disable` される。

共通エンジンからモンスター固有処理への分岐（`mhdp_monsters:core/switch/*`）は、
`mhdp_core:monster_data` storage の `MonsterData[{Uid:<uid>}]` の `Name`（= 小文字 prefix）を使ったマクロ呼び出しで行われる。

| きっかけ | 共通エンジン側 | → 呼ばれるモンスター固有関数 |
| --- | --- | --- |
| 毎 tick | `mhdp_core:tick` が `execute as @e[type=item_display,tag=Mns.Root] at @s run function mhdp_monsters:core/switch/tick` → Uid 分岐 | `mhdp_monster_<name>:core/tick/tick` |
| プレイヤー→モンスター被弾 | `mhdp_monsters:core/switch/damage` | `mhdp_monster_<name>:core/damage/damage` |
| HP 0 到達 | `damage_common_data` → `mhdp_monsters:core/switch/death` | `mhdp_monster_<name>:core/death/death` |
| クエスト終了 / 消滅時間経過 | `mhdp_monsters:core/switch/remove` | `mhdp_monster_<name>:core/remove/remove` |
| クエスト開始時の召喚 | `mhdp_monsters:core/switch/summon`（`datapack enable` 後） | `mhdp_monster_<name>:core/summon/summon` |
| 途中乱入 | `mhdp_monsters:core/switch/intrusion` | `mhdp_monster_<name>:core/summon/intrusion` |
| プレイヤー取得（マップ処理） | `mhdp_monsters:core/switch/fetch_player` | `mhdp_monster_<name>:core/util/fetch_player` |
| まばたき | `mhdp_monsters:core/switch/apply_blink` | `mhdp_monster_<name>:core/util/apply_blink` |
| ボスバー表示更新 | `mhdp_monsters:core/switch/show_bossbar` | `mhdp_monster_<name>:core/util/show_bossbar` |
| 攻撃判定開始（`start_attack.m` から） | `mhdp_monsters:core/switch/start_attack`（`$(Part)` 分岐） | `mhdp_monster_<name>:core/tick/on_battle/attack/<part>` |
| データパックロード / 解放 | `mhdp_monsters:core/switch/enable_datapack` / `disable_datapack` | `datapack enable/disable "file/mhdp_monster_<name>"` |

`@s` は基本的に `item_display` の Root エンティティ（`tag=Mns.Root.<Upper>` かつ共通 `Mns.Root`）。

### 0.4 実行フロー（全体像）

```
[召喚] core/summon/summon
        → core/register（データ登録）
        → mhdp_monsters:core/super/summon/（Uid スコア化）
        → AJ summon（モデル生成）
        → Root as → core/init/（ステータス計算・ボスバー・待機アニメ再生）

[毎tick] mhdp_monsters:core/switch/tick → core/tick/tick
        → core/tick/main
            → AJ on_tick
            → mhdp_monsters:core/super/tick/pre_tick
            → mhdp_monsters:core/super/tick/in_tick（まばたき・怒り時間減少・討伐後消滅等）
            → Phase 分岐:
                Phase 0 → core/tick/on_relax/tick   （警戒度 Caution を上げる）
                Phase 1 → core/tick/on_caution/tick  （発見度 Search を上げる）
                Phase 2 → core/tick/on_battle/tick    （ヘイト更新・建築物サーチ）
            → core/tick/animation/event/main（再生中アニメの frame を監視しイベント発火）
            → mhdp_monsters:core/super/tick/post_tick（埋まり対策・一時storage掃除）
        怒り中は Mns.Anger.Speed に応じて core/tick/main を追加実行

[行動ループ] アニメーション終了フレーム
        → core/tick/animation/event/<anim>/end
        → core/tick/animation/change/main（次の行動を選択）
            → Phase 別に Anim.* タグを付与
            → core/tick/animation/change/play/main（タグに応じて AJ アニメを tween 再生）

[被弾] mhdp_monsters:core/switch/damage → core/damage/damage
        → 非戦闘時は戦闘フェーズへ移行（on_battle/start_ambush）
        → mhdp_monsters:core/util/damage/damage_common_data（HP・怒り・状態異常・スタン・相殺・減気・龍気を共通減算、HP0 で death 分岐）
        → 部位耐久値を減算し Mns.Temp.Damage.<Part> を付与
        → 怯みリアクション core/damage/reaction/* を優先度順に 1 つだけ適用
        → 状態異常発動（毒・爆破）
        → タグ掃除
```

---

## 1. 必須エントリポイント（共通エンジンとの契約）

以下は**必ず存在させる**（存在しないと共通エンジンからの呼び出しでエラー / 動作不能）。

| パス（`mhdp_monster_<name>:` 以下） | 呼び出し元 | 役割 |
| --- | --- | --- |
| `load` | （enable_datapack によるリロードで手動誘発、または register 側で自己完結） | `core/register` を呼ぶだけ |
| `core/register` | `load`、`core/summon/summon`、`core/debug/interrupt` | スコアボード定義 + `mhdp_core:monster_data` への `MonsterData` / `DefenceData` / `AttackData` 登録 |
| `core/summon/summon` | `mhdp_monsters:core/switch/macro/m.summon` | 召喚処理本体 |
| `core/summon/intrusion` | `mhdp_monsters:core/switch/macro/m.intrusion` | 途中乱入処理本体 |
| `core/init/`（ファイル名は `.mcfunction`、拡張子前が空） | `core/summon/summon`（Root as で実行） | 召喚直後のステータス計算・ボスバー生成・待機アニメ再生 |
| `core/remove/remove` | `mhdp_monsters:core/switch/macro/m.remove` | 消去処理（ボスバー削除・スコアリセット・モデル削除） |
| `core/death/death` | `mhdp_monsters:core/switch/macro/m.death` | 討伐時処理 |
| `core/damage/damage` | `mhdp_monsters:core/switch/macro/m.damage` | 被ダメージ処理 |
| `core/tick/tick` | `mhdp_monsters:core/switch/macro/m.tick` | tick エントリ |
| `core/tick/main` | `core/tick/tick` | tick 本体 |
| `core/tick/on_relax/tick` / `on_caution/tick` / `on_battle/tick` | `core/tick/main`（Phase 分岐） | フェーズ別 tick |
| `core/tick/animation/event/main` | `core/tick/main` | アニメーションイベントハンドラのディスパッチャ |
| `core/tick/animation/change/main` | 各アニメの `event/<anim>/end` | 行動選択のエントリ |
| `core/tick/on_battle/attack/<part>` | `mhdp_monsters:core/switch/macro/m.start_attack`（`$(Part)` 分岐） | 攻撃判定開始（part = `head` / `body` / `tail` / `none` 等）。先頭に `execute if entity @s[type=item_display] run return 1` を置く |
| `core/tick/on_battle/attack/end` | `mhdp_monsters:core/util/tick/event/end_attack` | 攻撃判定終了時の後始末 |
| `core/util/fetch_player` | `mhdp_monsters:core/switch/macro/m.fetch_player` | 同エリアプレイヤーに候補タグ付与・ボスバー対象更新 |
| `core/util/apply_blink` | `mhdp_monsters:core/switch/macro/m.apply_blink` | まばたきモデル差し替え |
| `core/util/show_bossbar` | `mhdp_monsters:core/switch/macro/m.show_bossbar` | `bossbar set ... players @a[tag=Ply.State.MnsTarget]` |
| `core/util/show_toast` / `core/util/hide_toast` | `core/damage/reaction/**`、`schedule` | 部位破壊トーストの grant / revoke |
| `advancement/toast_break.json` | `core/util/show_toast` | 部位破壊トースト用の隠し進捗 |
| `_index.d.mcfunction` | （Spyglass 静的解析用。ゲーム挙動なし） | タグ / スコアホルダーの `#declare` 宣言 |

> `intrusion` は dino / ranposu では**旧コードのコピペが残っており実際には未完成**（存在しない `core/summon/summon_init` を参照している）。乱入を実装しない場合でもファイル自体は置く。実装する場合は `core/summon/summon` と同じ流れ（AJ summon → `Mns.Temp.IsSummonAnimation` 付与 → Root as で `core/init/`）にする。

---

## 2. 標準ディレクトリ構成

```
data/mhdp_monster_<name>/
├── advancement/
│   └── toast_break.json
└── function/
    ├── _index.d.mcfunction              タグ/スコア宣言（静的解析用）
    ├── load.mcfunction                  → core/register
    └── core/
        ├── register.mcfunction          スコア定義 + monster_data 登録
        ├── init/
        │   └── .mcfunction              召喚時ステータス計算（"core/init/" として呼ばれる）
        ├── summon/
        │   ├── summon.mcfunction
        │   └── intrusion.mcfunction
        ├── remove/
        │   └── remove.mcfunction
        ├── death/
        │   └── death.mcfunction
        ├── debug/
        │   ├── interrupt.mcfunction          任意アニメを強制発火（開発用）
        │   └── interrupt_anger.mcfunction    怒り強制発火（開発用）
        ├── damage/
        │   ├── damage.mcfunction
        │   ├── reaction/                怯みリアクション（1被弾につき最大1つ適用）
        │   │   ├── anger.mcfunction         怒り移行
        │   │   ├── counter.mcfunction       相殺怯み
        │   │   ├── stun.mcfunction          スタン
        │   │   ├── paralysis.mcfunction     麻痺（任意）
        │   │   ├── ambush.mcfunction        不意打ち（非戦闘中の初撃）
        │   │   ├── head.mcfunction / body.mcfunction / tail.mcfunction / leg_l.mcfunction / ...
        │   │   └── （部位破壊トリガや大ダウン sp.mcfunction など固有分）
        │   └── break/                   部位破壊処理
        │       ├── head.mcfunction / tail.mcfunction / tail_cut.mcfunction / ...
        └── tick/
            ├── tick.mcfunction
            ├── main.mcfunction
            ├── effect_anger.mcfunction       怒り演出（マクロ、任意）
            ├── on_relax/
            │   ├── tick.mcfunction
            │   ├── start.mcfunction
            │   └── update_caution.mcfunction
            ├── on_caution/
            │   ├── tick.mcfunction
            │   ├── start.mcfunction
            │   └── update_search.mcfunction
            ├── on_battle/
            │   ├── tick.mcfunction
            │   ├── start.mcfunction
            │   ├── start_ambush.mcfunction
            │   ├── check_target.mcfunction
            │   ├── update_target.mcfunction
            │   ├── update_hate.mcfunction
            │   ├── attack/
            │   │   ├── head.mcfunction / body.mcfunction / tail.mcfunction / end.mcfunction
            │   └── interact/                建築物（オブジェクト）との相互作用
            │       ├── on_search_object.mcfunction
            │       ├── on_attack_object.mcfunction
            │       └── reaction/...
            ├── animation/
            │   ├── change/
            │   │   ├── main.mcfunction               行動選択のハブ
            │   │   ├── on_relax/main.mcfunction
            │   │   ├── on_caution/main.mcfunction
            │   │   ├── on_battle/main.mcfunction      + first/near/middle/far/... の距離別
            │   │   └── play/
            │   │       ├── main.mcfunction            Anim.* タグ → AJ tween 再生
            │   │       └── turn.mcfunction            軸合わせ再生
            │   └── event/
            │       ├── main.mcfunction                再生中アニメ判定 → 各ハンドラ呼び出し
            │       └── <anim名>/
            │           ├── main.mcfunction            frame ごとの効果音・移動・攻撃発火
            │           ├── attack.mcfunction          apply_attack.m を呼ぶ実体
            │           └── end.mcfunction             → core/tick/animation/change/main
            └── util/
                ├── fetch_player.mcfunction
                ├── apply_blink.mcfunction
                ├── end_blink.mcfunction
                ├── show_bossbar.mcfunction
                ├── show_toast.mcfunction
                ├── hide_toast.mcfunction
                ├── models/                  部位状態に応じた item_model 差し替え（AJ as_node）
                │   ├── anger_start.mcfunction / anger_end.mcfunction
                │   ├── break_head.mcfunction / break_tail.mcfunction / ...
                │   └── （赤熱化・錆び等の固有状態分）
                └── phase/                   固有フェーズ（部位加熱など、任意）
                    ├── <state>_check.mcfunction
                    ├── <state>_start.mcfunction
                    └── <state>_end.mcfunction
```

固有アニメーション数に比例して `tick/animation/event/<anim>/` の数が増える（ranposu = 約 39 グループ、dino = 約 78 グループ）。

---

## 3. 各共通ファイルの処理仕様

### 3.1 `function/_index.d.mcfunction`

Spyglass（データパック言語サーバ）用のタグ宣言ファイル。`# @private` 付き、ゲーム上の挙動はない。

```
#> mhdp_monster_<name>:_index.d
# @private

#> tag
# @within function mhdp_monster_<name>:/**

## tag
# item_display
    #declare tag Mns.Root.<Upper> <表示名>Rootエンティティ
# 当たり判定
    #declare tag Mns.HitBox.<Upper> <表示名>当たり判定スライム
    #declare tag Mns.HitBox.<Upper>.Head 頭
    #declare tag Mns.HitBox.<Upper>.Body 胴
    ...（部位ごと）
# 一時
    #declare tag Mns.Temp.Damage.Head 頭怯み
    ...
# プレイヤー
    #declare tag Mns.Candidate.<Upper> ターゲット候補になるプレイヤー
    #declare tag Mns.Target.<Upper> 現在狙っているプレイヤー
# 部位破壊
    #declare tag Mns.Break.Head 頭部位破壊
    ...
```

固有の状態タグ・コンボタグ・アニメーションタグもここに宣言する。

### 3.2 `function/load.mcfunction`

```
#> mhdp_monster_<name>:load

# データ登録
    function mhdp_monster_<name>:core/register
```

### 3.3 `function/core/register.mcfunction`

`@s` なし（サーバー実行）。以下を順に行う。

1. **スコアボード定義** — `scoreboard objectives add Mns.<Upper>.<...> dummy`
   - 部位ごとに `Mns.<Upper>.<Part>.Damage` と `Mns.<Upper>.<Part>.Damage.Max`
   - 怯み回数カウント `Mns.<Upper>.<Part>.Damage.Count`、フェーズカウント `Mns.<Upper>.PhaseCount.*`
   - `Mns.<Upper>.Caution` / `Mns.<Upper>.Search` / `Mns.<Upper>.Hate`（プレイヤーに付くスコア）
2. **`MonsterData` 登録** — 既存を消してから append（§4.1 のスキーマ）
   ```
   execute if data storage mhdp_core:monster_data MonsterData[{Uid:<uid>}] run data remove storage mhdp_core:monster_data MonsterData[{Uid:<uid>}]
   data modify storage mhdp_core:monster_data MonsterData append value { Uid:<uid>, Name:"<name>", UpperName:"<Upper>", ... }
   ```
3. **`DefenceData` 登録** — 肉質テーブル（§4.2）
4. **`AttackData` 登録** — `{Uid:<uid>, Attacks:[]}` を作ってから攻撃ごとに `.Attacks append value {...}`（§4.3）

> 攻撃データを分割したい場合でも、新形式では `core/register` 1 本に集約する（旧 valk の `core/init/init_monster_data` + `core/init/init_attack_data` 分割はしない）。

### 3.4 `function/core/summon/summon.mcfunction`

```
# データ登録（register を直接呼ぶ。呼ばない実装もあるが呼ぶのが安全）
    function mhdp_monster_<name>:core/register
# 共通処理（TargetMonsterData.Uid をスコア #mhdp_temp_monster_uid にする）
    function mhdp_monsters:core/super/summon/
# データ初期化（この後 super/init が参照する）
    data modify storage mhdp_core:temp TargetMonsterData set from storage mhdp_core:monster_data MonsterData[{Uid:<uid>}]
# モデル召喚
    function animated_java_<name>:<name>/summon {args: {}}
# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.<Upper>] add Mns.Temp.IsIdleAnimation
# Root 対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.<Upper>] at @s run function mhdp_monster_<name>:core/init/
```

### 3.5 `function/core/init/.mcfunction`（`core/init/` として呼ばれる）

`@s` = Root エンティティ、`at @s`。

```
# 共通処理（実HP・耐性値・怒り/麻痺/毒/爆破/罠のパラメータをすべて計算、当たり判定初期化）
    function mhdp_monsters:core/super/init/
# ボスバー作成
    bossbar add mhdp_monster:<name> {"text":""}
    function mhdp_monsters:core/util/tick/update_bossbar.m {Monster:"<name>",State:"relax"}
    execute store result bossbar mhdp_monster:<name> max   run scoreboard players get @s Mns.Hp
    execute store result bossbar mhdp_monster:<name> value run scoreboard players get @s Mns.Hp
# 同士討ちダメージ有効化
    function mhdp_monsters:core/util/tick/event/enable_damage.m {Name:"<name>"}
# 部位耐久値（Mns.Hp を基礎に <Part>PartDamage% を掛けて算出）
    execute store result score @s Mns.<Upper>.Head.Damage ... run scoreboard players get @s Mns.Hp
    execute store result score #mhdp_temp_multiply MhdpCore run data get storage mhdp_core:temp TargetMonsterData.HeadPartDamage
    scoreboard players operation @s Mns.<Upper>.Head.Damage *= #mhdp_temp_multiply MhdpCore
    execute store result score @s Mns.<Upper>.Head.Damage.Max run scoreboard players operation @s Mns.<Upper>.Head.Damage /= #const_100 Const
    ...（部位ごと）
# 固有スコア初期化（フェーズカウント・怯み回数・移動回数など 0 リセット）
# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid
# 待機アニメーション再生
    execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java_<name>:<name>/animations/idle_relax/play
```

`mhdp_monsters:core/super/init/` が行うこと（重要 — 固有コードで再計算しない）:
- `Mns.Uid` セット、プレイヤー数取得、エリア情報取得
- 実 HP 計算 = `Hp` × クエスト HP 倍率 × プレイヤー数倍率（`#const_hp_playercount_multiply` = 40 → プレイヤー1人ごとに +40%）
- `Mns.Hp.Half`、`Mns.Stun.Damage(.Max)`、`Mns.Tire.Damage(.Max)`、`Mns.Anger.Damage(.Max)`、`Mns.Anger.Timer(.Max)`、`Mns.Anger.AttackMutiply`、`Mns.Anger.Speed`
- 麻痺 / 毒 / 爆破 / 龍気 / 相殺の耐性値・継続時間・効果ダメージ
- `Mns.Param.Is*Enable` タグ（麻痺・毒・爆破・閃光玉・音爆弾・痺れ罠・落とし穴）
- `Mns.Param.IsHideHp`、`Mns.Param.IsHardcore`
- モデル nbt（`teleport_duration`, `brightness`）
- 当たり判定スライムの初期化（`mhdp_monsters:core/super/init/init_hitbox`）

### 3.6 `function/core/remove/remove.mcfunction`

```
# ボスバー削除
    bossbar remove mhdp_monster:<name>
# プレイヤーに付いた固有スコアをリセット
    scoreboard players reset @a Mns.<Upper>.Caution
    scoreboard players reset @a Mns.<Upper>.Search
    scoreboard players reset @a Mns.<Upper>.Hate
# モデル削除
    function animated_java_<name>:<name>/remove/this
# （弾 / VFX は `assets:object/` エンティティ [`Asset.Object` タグ]。放置中の弾が残る恐れがあるなら
#   モンスター固有タグ [例 `Mns.<Upper>.Object.*` や `Mns.Shot.<Upper>*`] を付けておき kill @e[tag=...] する。詳細は §3.18）
```

### 3.7 `function/core/death/death.mcfunction`

```
# 状態更新
    tag @s add Mns.State.Death
    tag @s remove Mns.State.IsAnger
# 討伐アニメーション（飛行中は共通の death_flying へ）
    execute if entity @s[tag=!Mns.State.IsFlying] run function animated_java_<name>:<name>/animations/death/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying]  run function mhdp_monsters:core/util/damage/death_flying
# 当たり判定削除
    execute as @e[type=slime,tag=Mns.HitBox.<Upper>] run function mhdp_monsters:core/util/other/remove_hitbox
# ボスバー削除
    bossbar remove mhdp_monster:<name>
# クエスト側の討伐処理へ
    execute store result storage mhdp_core:temp Arg.MonsterUid int 1 run scoreboard players get @s Mns.Uid
    function mhdp_core:phase/3_quest/call_from_monster/death
```

実体（`item_display`）は `Mns.State.Death` 付与後、`mhdp_monsters:core/super/tick/in_tick` により約 600 tick（30 秒）後に `mhdp_monsters:core/switch/remove` される。

### 3.8 `function/core/damage/damage.mcfunction`

`@s` = Root、`at @s`。共通エンジンから渡される入力スコア（`#mhdp_temp_*` on `MhdpCore` / `Const` 等）:

| スコアホルダー | 意味 |
| --- | --- |
| `#mhdp_temp_target_part_id MhdpCore` | 攻撃を受けた部位 ID（DefenceData の行 index） |
| `#mhdp_temp_damage_total MhdpCore` | 総ダメージ量 |
| `#mhdp_temp_damage_phys_type` / `_phys_value` | 物理ダメージ種別 / 量 |
| `#mhdp_temp_damage_element_value` | 属性ダメージ量 |
| `#mhdp_temp_damage_partdamage_value` | 部位ダメージ量 |
| `#mhdp_temp_condition_value_poison` / `_paralysis` / `_bomb` | 状態異常蓄積量 |
| `#mhdp_temp_damage_stun_value` / `_tire_value` / `_dragonaura_value` | スタン / 減気 / 龍気量 |

処理順:

```
# 1. 非戦闘時は戦闘へ移行
    execute unless score @s Mns.General.Phase matches 2 run function mhdp_monster_<name>:core/tick/on_battle/start_ambush
# 2. 共通ステータス減算（HP・怒り・状態異常・スタン・相殺・減気・龍気。HP0で death 分岐）
    function mhdp_monsters:core/util/damage/damage_common_data
    execute if entity @s[tag=Mns.State.Death] run return 0
# 3. チュートリアル用フラグ処理（あれば）
# 4. 攻撃プレイヤーのヘイト加算
    scoreboard players add @a[tag=Mns.Candidate.<Upper>,tag=Temp.Attacker] Mns.<Upper>.Hate 10
# 5. 部位耐久値の減算 → 0 以下で Mns.Temp.Damage.<Part> を付与
    execute if score #mhdp_temp_target_part_id MhdpCore matches <partId> run scoreboard players operation @s Mns.<Upper>.<Part>.Damage -= #mhdp_temp_damage_partdamage_value MhdpCore
    execute if score @s Mns.<Upper>.<Part>.Damage matches ..0 run tag @s add Mns.Temp.Damage.<Part>
# 6. ボスバー値更新
    execute if entity @s[tag=!Mns.Param.IsHideHp] store result bossbar mhdp_monster:<name> value run scoreboard players get @s Mns.Hp
# 7. 怯み適用（優先度順。1被弾で最大1つ。適用したら Mns.Temp.IsDamaged が立ち以降スキップ）
    execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Paralysis] run function .../reaction/paralysis
    execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Stun]      run function .../reaction/stun
    execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Counter]   run function .../reaction/counter
    execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.<Part>]    run function .../reaction/<part>
    execute if entity @s[tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Damage.Anger]     run function .../reaction/anger
# 8. 状態異常発動
    execute if entity @s[tag=Mns.Temp.Damage.Poison] run function mhdp_monsters:core/util/damage/reaction_poison
    execute if entity @s[tag=Mns.Temp.Damage.Bomb]   run function mhdp_monsters:core/util/damage/reaction_bomb
# 9. 終了：タグ掃除
    function mhdp_monsters:core/util/damage/remove_tags
    tag @s remove Mns.Temp.Damage.<Part>   （部位ごと）
```

`damage_common_data` が自動でやってくれること（固有コードに書かない）:
- HP / `Mns.Hp.Half` 減算、`Mns.State.IsDisableDeath` 時の 1 残し、HP 半減時 `check_hp_half`、HP0 時 `mhdp_monsters:core/switch/death`
- 怒り耐性 `Mns.Anger.Damage` 減算 → 0 で `Mns.Temp.Damage.Anger`
- 毒 / 麻痺 / 爆破耐性の減算 → 0 で `Mns.Temp.Damage.Poison|Paralysis|Bomb`
- 相殺 → `Mns.Temp.Damage.Counter`、`api:` storage への `Return.Counter` / `Return.CounterSuccess`
- スタン（頭当たり判定ヒット時のみ）→ `Mns.Temp.Damage.Stun`
- 減気 → `Mns.Temp.Damage.Tire`、龍気 → `Mns.Temp.Damage.DragonAura`

### 3.9 `function/core/damage/reaction/*.mcfunction`

各怯みリアクションの定型:

```
# 共通処理
    function mhdp_monsters:core/util/damage/on_reaction_start   # サーチ状態解除・攻撃終了
    scoreboard players operation @s Mns.<Upper>.<Part>.Damage = @s Mns.<Upper>.<Part>.Damage.Max  # 耐性値リセット
    #  or 相殺/スタンは *= #const_<x>_damage_multiply /= #const_100 で耐性上昇
# 麻痺・ダウン・スタン中はアニメを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
# アニメーション再生（飛行中は共通 reaction_flying へ）
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_<name>:<name>/animations/damage_<part>/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged]  run function mhdp_monsters:core/util/damage/reaction_flying
# 独自処理（攻撃者を向く / ダウン時間 Mns.General.DownCount / モデル変更 / 効果音）
# 終了
    tag @s add Mns.Temp.IsDamaged
```

- `reaction/anger`: 追加で `scoreboard players operation @s Mns.Anger.Damage = @s Mns.Anger.Damage.Max` と `function mhdp_monsters:core/util/tick/start_anger.m {Name:"<name>"}`（`Mns.State.IsAnger` 付与・タイマー・ボスバー名更新）。モデルは `core/util/models/anger_start` で差し替え。
- `reaction/head` など部位系: 冒頭で `execute if entity @s[tag=!Mns.Break.<Part>] run function .../core/damage/break/<part>` を呼び、部位破壊カウントが閾値に達したら破壊。
- `reaction/ambush`: 非戦闘中に初撃を受けたとき（`on_battle/start_ambush` から）。攻撃者の前後左右を判定して向きに応じた怯みアニメを再生。
- `reaction/counter`: `Mns.Counter.Damage.Max *= #const_counter_damage_multiply (200) /= #const_100`。攻撃者が近ければ正面に `tp`。

### 3.10 `function/core/tick/tick.mcfunction` / `main.mcfunction`

`tick.mcfunction`（定型 — そのまま流用可）:

```
# メイン処理
    function mhdp_monster_<name>:core/tick/main
# 怒り中、Mns.Anger.Speed ごとに main を追加実行（行動高速化）
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players add @s Mns.Temp.AngerSpeed.Timer 1
    execute if entity @s[tag=!Mns.State.IsDisableAngerSpeed] if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed at @s run function mhdp_monster_<name>:core/tick/main
    execute if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed run scoreboard players set @s Mns.Temp.AngerSpeed.Timer 0
```

> **弾 / VFX を出すモンスター**: モンスター側の `tick` に弾ループを足さない。弾・飛び道具・追従 VFX は共通の `assets:object/` システムで扱う（§3.18）。旧 valk のような `core/tick/shot/*` を monster datapack 内に持つ設計は**廃止**。

`main.mcfunction`（定型 — そのまま流用可）:

```
# Animated Java 側処理
    function animated_java:global/data_manager/on_tick
    function animated_java:global/root/on_tick
# 共通 tick 開始/中処理
    function mhdp_monsters:core/super/tick/pre_tick
    function mhdp_monsters:core/super/tick/in_tick
# Phase 分岐
    execute if score @s Mns.General.Phase matches 0 run function mhdp_monster_<name>:core/tick/on_relax/tick
    execute if score @s Mns.General.Phase matches 1 run function mhdp_monster_<name>:core/tick/on_caution/tick
    execute if score @s Mns.General.Phase matches 2 run function mhdp_monster_<name>:core/tick/on_battle/tick
# アニメーションイベントハンドラ
    function mhdp_monster_<name>:core/tick/animation/event/main
# 共通 tick 終了処理
    function mhdp_monsters:core/super/tick/post_tick
```

`super/tick/pre_tick`: 一時 storage `mhdp_core:temp MonsterTemp` 初期化、現在エリア・現在位置保持、`Mns.General.TickTimer` を 20 ごとに `Mns.Temp.IsTick` へ。
`super/tick/in_tick`: まばたき（40 tick + 30% 確率）、怒り時間減少、討伐後 600 tick で remove。
`super/tick/post_tick`: forceload 範囲外なら強制 remove、ブロック / 建築への埋まり対策、`MonsterTemp` 掃除、`Mns.Temp.IsTick` 除去。

### 3.11 `function/core/tick/on_relax/*` （Phase 0 = 未発見）

- `tick.mcfunction`:
  ```
  execute if entity @s[tag=Mns.Temp.IsTick] run function .../on_relax/update_caution
  execute if entity @a[tag=Mns.Candidate.<Upper>,scores={Mns.<Upper>.Caution=1000..}] run function .../on_caution/start
  ```
- `update_caution.mcfunction`: `mhdp_monsters:core/util/tick/fetch_player/check_player_situation.m {Tag:"Mns.Candidate.<Upper>",DistNear:12,DistFar:30,Fov:60.0}` でプレイヤーに `Mns.Temp.Situation.*`（InFov / Near|Middle|Far / IsSprinting|IsSneaking|IsCovering）を付与し、その組み合わせで `Mns.<Upper>.Caution` をプレイヤーごとに加算。最後に `fetch_player/remove_tag`。
- `start.mcfunction`: `Mns.General.Phase` を 0 に、ボスバー名を `relax` に、`Mns.State.IsBattle` を除去。

### 3.12 `function/core/tick/on_caution/*` （Phase 1 = 警戒中）

- `tick.mcfunction`: `update_search` を tick ごと、`Mns.<Upper>.Search>=1000` で `on_battle/start`。
- `update_search.mcfunction`: `on_relax` と同様だが `Fov:170.0` と発見度 `Mns.<Upper>.Search` の加算。別エリアのプレイヤーは `Search` を減衰。全員 0 で `on_relax/start` に戻る。
- `start.mcfunction`: `Mns.General.Phase` を 1 に、ボスバー名を `caution` に。

### 3.13 `function/core/tick/on_battle/*` （Phase 2 = 戦闘中）

- `tick.mcfunction`: `Mns.Temp.IsTick` ごとに `update_hate`、`Mns.State.IsSearchObject` 中は前方の建築物 HitBox を探す。
- `start.mcfunction`: `Mns.General.Phase` を 2 に、頭上に "!" テキスト表示（`api:object/summon.m {ObjectId:9}` を頭 HitBox に ride）、ボスバー名を `battle` に、既発見プレイヤーへ大ヘイト、初回は `Mns.Temp.Anim.IsFirstContact` 付与、`Mns.State.IsBattle` 付与。
- `start_ambush.mcfunction`: 非戦闘中に被弾したとき。攻撃者へ `Search=1000` `Hate+=500`、Phase 2、"!" 表示、`Mns.State.IsBattle`、最後に `function .../core/damage/reaction/ambush`。
- `check_target.mcfunction`: ターゲットが同エリアにいなければ `Mns.Target.<Upper>` を外し、いなければ `update_target`。
- `update_target.mcfunction`: `mhdp_monsters:core/util/tick/fetch_player/check_max_hate.m {CandidateTag,TargetTag,Score}` で最ヘイトプレイヤーに `Mns.Target.<Upper>`。付けられなければ最寄りに。ターゲットのヘイトを 300 減、`Mns.General.ActCount.Target` を 0 に。
- `update_hate.mcfunction`: 距離別に `Mns.<Upper>.Hate` を加算。別エリアのプレイヤーは減衰。全員の `Search` が 0 で `on_caution/start` に戻る。
- `attack/<part>.mcfunction`: `mhdp_monsters:core/switch/start_attack` から `$(Part)` で呼ばれる。定型:
  ```
  execute if entity @s[type=item_display] run return 1        # エラー検知用（成功を返す）
  execute if entity @s[type=slime,tag=Mns.HitBox.<Upper>.<Part>] run tag @s add Mns.State.IsAttackPart
  ```
- `attack/end.mcfunction`: `mhdp_monsters:core/util/tick/event/end_attack` から。攻撃中タグの掃除等。

### 3.14 `function/core/tick/animation/change/*` （行動選択）

**`change/main.mcfunction`** — 行動選択のハブ。各アニメの `event/<anim>/end` から呼ばれる。

```
# 事前処理：アニメが途切れないよう、まず待機アニメを 1 フレームだけ tween
    execute if score @s Mns.General.Phase matches 0 run function animated_java_<name>:<name>/animations/idle_relax/tween {duration:1, to_frame: 0}
    execute unless score @s Mns.General.Phase matches 0 run function animated_java_<name>:<name>/animations/idle/tween {duration:1, to_frame: 0}
# 共通処理
    function mhdp_monsters:core/util/tick/check_animation_tag       # 既に Anim.* が付いているか（コンボ用）
    function mhdp_monster_<name>:core/tick/on_battle/check_target
    execute if entity @s[tag=Mns.State.IsAnger] if score @s Mns.Anger.Timer matches ..0 run function mhdp_monsters:core/util/tick/end_anger.m {Name:"<name>"}
# Phase 別の行動選択（Anim.* タグを付与する）
    execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 0 run function .../animation/change/on_relax/main
    execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 1 run function .../animation/change/on_caution/main
    execute if entity @s[tag=!Mns.Temp.IsAlreadyAnimation] if score @s Mns.General.Phase matches 2 run function .../animation/change/on_battle/main
# 軸合わせ or 通常再生
    execute if entity @s[tag=Mns.Temp.IsTurn]  run function .../animation/change/play/turn
    execute if entity @s[tag=!Mns.Temp.IsTurn] run function .../animation/change/play/main
# 終了
    tag @s remove Mns.Temp.IsTurn
    tag @s remove Mns.Temp.Anim.IsFirstContact
    tag @s remove Mns.Temp.IsAlreadyAnimation
```

- `change/on_relax/main`: 低確率で `Anim.Ecology`（生態行動）、それ以外は `play/relax_walk`（歩き）。
- `change/on_caution/main`: `Anim.Search` を付ける。
- `change/on_battle/main`: 行動回数（`ActCount.Target` / `ActCount.Idle`）を加算し、初回発見 / 近距離 / 中遠距離で `on_battle/{first,near,middle}` に `return run` で委譲。各所で距離・確率・怒り状態を見て `Anim.<技名>` タグを付ける。
- `change/play/main`: `Anim.<技名>` タグを見て対応する AJ アニメを `function animated_java_<name>:<name>/animations/<anim>/tween {duration:1, to_frame:1}` で再生。最後に `mhdp_monsters:core/util/other/remove_animation_tag` で全 `Anim.*` を掃除、`Mns.Temp.IsCombo` も除去。
- `change/play/turn`: ターゲットが正面なら `Mns.Temp.IsTurn` を外して即実行。左右判定して `turn_right` / `turn_left` を再生。

### 3.15 `function/core/tick/animation/event/*` （アニメーションイベント）

**`event/main.mcfunction`** — 再生中アニメを `tag=animated_java_<name>.<name>.animation.<anim>.playing` で判定し、対応するハンドラ `event/<anim>/main` を呼ぶだけのディスパッチャ。全アニメ分の行を並べる。

**`event/<anim>/main.mcfunction`** — そのアニメが再生されている間、毎 tick 実行される。`aj.<anim>.frame`（現在フレーム番号スコア）を見て:
- 効果音 `playsound ...`、パーティクル
- 前進移動 `tp @s ^ ^ ^<dist>`、接地判定 `function mhdp_monsters:core/util/tick/move/check_landing`
- 攻撃判定の開始 / 実行 / 終了:
  ```
  execute if score @s aj.<anim>.frame matches <f0> run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:<uid>}].Attacks[{Name:"<AtkName>"}]
  execute if score @s aj.<anim>.frame matches <f1> run function mhdp_monster_<name>:core/tick/animation/event/<anim>/attack
  execute if score @s aj.<anim>.frame matches <f2> run function mhdp_monsters:core/util/tick/event/end_attack
  ```
- 終了フレームで `execute if score @s aj.<anim>.frame matches <last> run function mhdp_monster_<name>:core/tick/animation/event/<anim>/end`

**`event/<anim>/attack.mcfunction`** — 当たり判定の実体。`mhdp_monsters:core/util/tick/event/apply_attack.m` を、プレイヤー用 / エンティティ用の Selector・オフセット・当たり判定サイズを引数にして呼ぶ:
```
function mhdp_monsters:core/util/tick/event/apply_attack.m {Uid:<uid>,AttackName:"<AtkName>",\
    Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..30]",\
        Player_Offset_X:0.0,Player_Offset_Y:1.6,Player_Offset_Z:5.0,\
        Player_Scale_X:1.8,Player_Scale_Y:1.9,Player_Scale_Z:2.0,\
    Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.<Upper>,distance=..30]",\
        Entity_Offset_X:0.0,Entity_Offset_Y:1.6,Entity_Offset_Z:4.1,\
        Entity_Scale_X:2.0,Entity_Scale_Y:3.0,Entity_Scale_Z:3.0\
}
```

**`event/<anim>/end.mcfunction`** — 通常は `function mhdp_monster_<name>:core/tick/animation/change/main`（次の行動選択へ）だけ。待機系は確率で `change/main`（威嚇ループ）。

**待機アニメの行動ループ起点**: `core/init/` で `idle_relax/play` → 毎 tick `event/idle_relax/main` → 最終フレームで `event/idle_relax/end` → 確率で `change/main` が呼ばれ、モンスターが行動を始める。

### 3.16 `function/core/util/*`

| ファイル | 処理 |
| --- | --- |
| `fetch_player.mcfunction` | `@a remove Mns.Candidate.<Upper>` → 同 `Fld.CurrentAreaId` のプレイヤーに `Mns.Candidate.<Upper>` 付与 → `bossbar set mhdp_monster:<name> players @a[tag=Mns.Candidate.<Upper>]` → Phase 2 中は候補の `Search` を 1000 に固定し `on_battle/check_target` |
| `apply_blink.mcfunction` | まばたき時、頭部ノードの `minecraft:item_model` を「〇〇_blink」バリアントに差し替え（`animated_java_<name>:<name>/as_node {name:'head_upper',command:'data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/<name>/head_upper_blink"'}`）。怒り・部位破壊・固有状態の組み合わせごとに分岐。 |
| `end_blink.mcfunction` | `apply_blink` の逆（blink なしモデルに戻す） |
| `show_bossbar.mcfunction` | `bossbar set mhdp_monster:<name> players @a[tag=Ply.State.MnsTarget]` |
| `show_toast.mcfunction` | `advancement grant @a[tag=Ply.State.PlayingQuest] only mhdp_monster_<name>:toast_break` → `schedule function mhdp_monster_<name>:core/util/hide_toast 5t replace` |
| `hide_toast.mcfunction` | `advancement revoke @a only mhdp_monster_<name>:toast_break` |
| `models/anger_start.mcfunction` / `anger_end.mcfunction` | 怒り開始 / 終了時に全部位ノードの item_model を怒りバリアントに差し替え（`as_node`） |
| `models/break_<part>.mcfunction` | 部位破壊時のモデル差し替え |
| `phase/<state>_start|end|check.mcfunction` | 固有の部位状態（例: dino の尻尾赤熱化・錆び、喉赤熱化）。`check` は tick から蓄積カウントを見て `start` を呼ぶ。`start` は状態タグ付与・当たり判定スライムの `Mns.Hitbox.PartId` 変更・モデル差し替え。 |

### 3.17 `advancement/toast_break.json`

部位破壊トースト表示用の隠し進捗。全モンスター共通の内容（`icon` の `item_model` だけモンスターごとに変える）:

```json
{
  "criteria": { "requirement": { "trigger": "minecraft:impossible" } },
  "display": {
    "announce_to_chat": false,
    "description": "---",
    "frame": "task",
    "hidden": true,
    "icon": { "components": { "minecraft:item_model": "icons/<name>" }, "id": "minecraft:stick" },
    "show_toast": true,
    "title": "部位破壊"
  }
}
```

### 3.18 弾 / 飛び道具 / 追従 VFX（`assets:object/` システム）

弾・ブレス・彗星・ビーム・爆発 VFX・切断部位など「モンスター本体から分離して動くもの」は、**monster datapack の中に持たず**、共通の `assets` データパックの **object システム**で実装する。

**アーキテクチャ**:

```
呼び出し側（monster の event/<anim>/attack など）:
    execute <positioned/facing/rotated で発射位置・方向を作る> run function api:object/summon.m {ObjectId:<N>}

共通エンジン:
    api:object/summon.m          → assets:core/object/summon.m {ObjectId:N}
                                 → assets:object/alias/N/summon → assets:object/<N>.<name>/summon/   ← summon コマンド実行
    （直後）assets:core/object/init.m {ObjectId:N}
                                 → assets:object/alias/N/init  → assets:object/<N>.<name>/init/      ← 初期化（角度確定・ObjectId スコア付与）
    毎 tick（mhdp_core:tick の `execute as @e[tag=Asset.Object] at @s run function assets:core/object/tick`）:
                                 → assets:object/alias/N/tick  → assets:object/<N>.<name>/tick/      ← 移動・当たり判定・演出・寿命
```

**object 1 個の構成**（`assets:object/<N>.<name>/`）:

| ファイル | 役割 |
|---|---|
| `_index.d.mcfunction` | この object 用のタグ宣言（`#declare tag <N>.OnGround` など。命名は `<ObjectId>.` プレフィックス） |
| `summon/.mcfunction` | `summon item_display ^ ^ ^ {teleport_duration:0,Tags:["Asset.Object","Asset.Object.Init"],transformation:{...scale:[0f,0f,0f]}}` を実行（発射位置は呼び出し側の実行座標。VFX が text_display ならそれを summon） |
| `init/.mcfunction` | 召喚直後 1 回。`tp @s ~ ~ ~ ~ ~` で角度固定は共通。**それ以外（速度・寿命・ターゲット保持・スケール・variant タグ付与）は object ごとに固有**。判断がつかない箇所は `# TODO` を残す。`ObjectId` スコアは共通側で自動付与 |
| `tick/.mcfunction` | 毎 tick のディスパッチ（移動前/接地後などで分岐して sub 関数へ）。`scoreboard players add @s ObjectTick 1` で経過管理、`execute if score @s ObjectTick matches <寿命>.. run kill @s` |
| `tick/move`, `tick/hit`, `tick/attack`, `tick/wait` … | 移動・被弾検知・攻撃実行・接地後演出など |

**当たり判定**は object の tick 内で行う。実行主体をモンスター root に戻して共通関数を呼ぶ:

```
# object の tick/attack 内
execute at @s as @n[type=item_display,tag=Mns.Root.<Upper>] run function mhdp_monsters:core/util/tick/event/apply_attack_distance.m {Uid:<uid>,AttackName:"<Name>",\
    Player_Selector:"@a[tag=Ply.State.EnableDamage,distance=..<r>]",Player_Offset_X:0.0,Player_Offset_Y:0.0,Player_Offset_Z:0.0,Player_Distance:<r>,\
    Entity_Selector:"@e[type=slime,tag=Entity.EnableDamage,tag=!Mns.HitBox.<Upper>,distance=..<r>]",Entity_Offset_X:0.0,Entity_Offset_Y:0.0,Entity_Offset_Z:0.0,Entity_Distance:<r>}
```

- `AttackData` は `Uid` + `AttackName` で引く（object は特定モンスターの Uid に紐づく）。
- 球状判定は `apply_attack_distance.m`、箱状判定は `apply_attack.m`。
- object → 建築物ヒットは `@n[type=shulker,tag=Asset.Build.HitBox,...]` を見る。

**ObjectId の割り当て**: モンスター固有 object は `<Uid の下 4 桁>x`（例: dino [Uid 1003] = `10031`, `10032` / valk [Uid 1004] = `1004x`）。汎用 object は `0001`〜。

**呼び出し側からのパラメータ渡し（`Arg.Override`）**: object を状況に応じて変えたい場合、summon 前に `data modify storage api: Arg.Override.<Key> set value <V>` を積む。`api:object/summon.m` が summon → init の後に `Arg.Override` を自動クリアする。object の `init/.mcfunction` で受け取る:

```
# init 内
execute store result score @s <Score> run data get storage api: Arg.Override.<Key>          # 数値を score へ
execute if data storage api: Arg.Override{<Key>:<V>} run tag @s add <ObjectId>.<Variant>     # 条件でタグ付与
```

実例: `assets:object/0001.normal_arrow/init`（`PlyUid` / `ChargeCount` / `Speed` / `Bin` …）, `0005.targetting_arrow/init`（`TargetUid`）, `0006.jump_arrow/init`。パラメータ不要なら dino_breath のように init は `tp @s ~ ~ ~ ~ ~` だけでよい。

**登録**: object フォルダを置き、`assets:object/alias/<N>/{init,summon,tick}.mcfunction` の 3 リダイレクトを書くだけ（マスタ一覧やロード時登録は不要）。

**実例**: `assets:object/10032.dino_breath`（ブレス）, `10031.dino_tail_flame`（尻尾の炎）, `0016.ground_crack`（地面のひび割れ、monster から `{ObjectId:16}` で呼ぶだけ）。

**`summon/debug.mcfunction`（デバッグ用手動召喚）**: 各 object の `summon/` に、`Arg.Override` を設定してから自身を `api:object/summon.m` で召喚する `debug.mcfunction` を用意する。実行者（プレイヤー）の位置・向きに召喚されるので、コマンドとして直接叩いて単体テストできる。

```
# 引数設定
    data modify storage api: Arg.Override set value {<Key>:<テスト値>, ...}
# 召喚
    function api:object/summon.m {ObjectId:<N>}
```

Override 引数が未確定の object は `data modify storage api: Arg.Override set value {}`（空）でよい。

---

## 4. データスキーマ

### 4.1 `MonsterData`（`mhdp_core:monster_data` storage の `MonsterData[]`）

| フィールド | 型 | 意味 |
| --- | --- | --- |
| `Uid` | int | グローバル一意 ID（既存: ranposu 1001, reus 1002, dino 1003, valk 1004…）。分岐の主キー |
| `Icon` | string | UI 用アイコン文字（`"uE013"` 等） |
| `Name` | string | 小文字 prefix。データパック名 `mhdp_monster_<Name>` / AJ 名前空間 `animated_java_<Name>` と一致 |
| `UpperName` | string | パスカルケース。タグ `Mns.Root.<UpperName>` 等に使用 |
| `NameId` | string | 翻訳キー（`"monster.dino.name"`） |
| `ShowName` | text component | ボスバー等の表示名 |
| `LootTable` | string | 剥ぎ取り / 報酬のルートテーブル ID |
| `ShowHp` | bool | ボスバーに HP を表示するか（false で `Mns.Param.IsHideHp`） |
| `Hp` | int | 基礎体力（実 HP はクエスト倍率・人数倍率が乗る） |
| `StunDamage` / `TireDamage` | int | スタン / 減気の基礎耐性（%: HP に対する割合として計算される） |
| `AngerDamagePer` | int | 怒り耐性（HP に対する %） |
| `AngerTimer` | int | 怒り継続秒数 |
| `AngerAttackMult` | int | 怒り中の攻撃力倍率（% 表記、115 = 1.15 倍） |
| `AngerSpeed` | int | 怒り中の行動高速化間隔（小さいほど速い） |
| `ParalysisDamage` / `ParalysisTimer` | int | 麻痺耐性 / 継続秒数（0 で無効） |
| `PoisonDamage` / `PoisonTimer` / `PoisonEffectDamage` | int | 毒耐性 / 継続秒数 / ダメージ（0 で無効） |
| `BombDamage` / `BombEffectDamage` | int | 爆破耐性 / ダメージ |
| `FlashBombEnable` / `SoundBombEnable` | bool | 閃光玉 / 音爆弾の有効 |
| `ParalyseTrapEnable` / `ParalyseTrapTimer` | bool / int | 痺れ罠の有効 / 効果秒数 |
| `HallTrapEnable` / `HallTrapTimer` | bool / int | 落とし穴の有効 / 効果秒数 |
| `CounterDamage` | int | 相殺耐性の基礎値 |
| `<Part>PartDamage` | int | 各部位の耐久値割合（% : `Head`,`Body`,`Tail`,`ArmR`,`ArmL`,`LegR`,`LegL`,`WingR`,`WingL` …部位構成に合わせる） |

### 4.2 `DefenceData`（肉質）

```
{ Uid:<uid>, Defences:[ [切,打,弾,火,水,雷,氷,龍], ... ] }
```

- 行 index = 部位 ID（`#mhdp_temp_target_part_id` と対応）。何行目が何の部位かは `core/register` にコメントで明記する。
- 各値は % ダメージ通り（大きいほど柔らかい）。

### 4.3 `AttackData`（新スキーマ）

```
{ Uid:<uid>, Attacks:[] }
```
に対して技ごとに append:

```
{
  Name:"Bite", AttackPart:"head", VectorType:"Normal",
  DamageValue:5.0f, ObjectDamageValue:10, GuardValue:2,
  ElementType:0, ElementMultiply:0,
  KnockbackStrength:1, IsLaunch:false, LaunchAngle:0,
  IsFixedDamage:false, IsDisableDefence:false, IsDisableDamageInterval:false, IsDisableGuts:false,
  Effect:{IsApplyEffect:true, EffectId:1, Level:3, Tick:50}     ← 状態異常付与技のみ
}
```

| フィールド | 意味 |
| --- | --- |
| `Name` | 技名。`event/<anim>/main` の `start_attack.m` / `apply_attack.m` から `Attacks[{Name:"..."}]` で参照 |
| `AttackPart` | 攻撃部位（`"head"` / `"body"` / `"tail"` / `"none"`）。`start_attack.m` → `on_battle/attack/<part>` の分岐に使われる |
| `VectorType` | ノックバック方向（`"Normal"` = 正面 / `"Radial"` = 放射状） |
| `DamageValue` | float 必須（`5.0f`）。基礎ダメージ |
| `ObjectDamageValue` | 建築物へのダメージ |
| `GuardValue` | ガード判定強度 |
| `ElementType` | 属性 ID（0=無 / 1=火 / 2=水 / 3=雷 / 4=氷 / 5=龍 …） |
| `ElementMultiply` | 属性ダメージ割合 |
| `KnockbackStrength` | ノックバック強度 |
| `IsLaunch` / `LaunchAngle` | 打ち上げ有無 / 角度 |
| `IsFixedDamage` | 固定ダメージ（肉質・防御無視） |
| `IsDisableDefence` | 防御力無視 |
| `IsDisableDamageInterval` | 同士討ち無敵時間無視 |
| `IsDisableGuts` | 根性（ど根性）無視 |
| `Effect` | 状態異常付与。`{IsApplyEffect,EffectId,Level,Tick}` |

> 旧 valk スキーマ（`Knockback`, `LaunchType`, `AttackPart` 欠落, `ObjectDamageValue` 欠落, `VectorType` 欠落）は使わない。全技を上記新スキーマに書き直す。

---

## 5. スコアボード / タグ命名規約

### 5.1 共通スコア（`mhdp_monsters:load` で定義済み。固有 register で再定義しない）

`Mns.General.Phase`（0/1/2）, `Mns.General.AnimationTimer`, `Mns.General.TickTimer`, `Mns.General.ActCount.Idle|Target|Move`, `Mns.General.TurnCount`, `Mns.General.DownCount`, `Mns.General.RemoveTimer`, `Mns.General.BlinkTimer(.Check)`, `Mns.Hp`, `Mns.Hp.Half`, `Mns.QuestAttackMultiply`, `Mns.Anger.Damage(.Max)`, `Mns.Anger.Timer(.Max)`, `Mns.Anger.AttackMutiply`, `Mns.Anger.Speed`, `Mns.Stun.Damage(.Max)`, `Mns.Tire.*`, `Mns.Paralysis.*`, `Mns.Poison.*`, `Mns.Bomb.*`, `Mns.DragonAura.*`, `Mns.Counter.*`, `Mns.Uid`, `Mns.Temp.AngerSpeed.Timer`, `Mns.Hitbox.PartId`, `Mns.Shot.Timer` ほか。
定数は `#const_100 Const`, `#const_2 Const`, `#const_20 Const`, `#const_<x>_damage_multiply Const` など。

### 5.2 固有スコア（`core/register` で定義）

- `Mns.<Upper>.<Part>.Damage` / `.Damage.Max` / `.Damage.Count`
- `Mns.<Upper>.PhaseCount.*`, `Mns.<Upper>.<固有カウント>`
- プレイヤーに付く: `Mns.<Upper>.Caution`, `Mns.<Upper>.Search`, `Mns.<Upper>.Hate`
- フレーム参照: `aj.<anim>.frame`（AJ が管理。参照のみ）

### 5.3 タグ

| タグ | 用途 |
| --- | --- |
| `Mns.Root` + `Mns.Root.<Upper>` | Root（item_display）。共通側のループ対象は `Mns.Root` |
| `Mns.HitBox` + `Mns.HitBox.<Upper>` + `Mns.HitBox.<Upper>.<Part>` | 当たり判定スライム。頭は共通 `Mns.HitBox.Head` も付ける（スタン判定用） |
| `Mns.Candidate.<Upper>` / `Mns.Target.<Upper>` | 同エリアのプレイヤー候補 / 現ターゲット |
| `Mns.Temp.Damage.<Part>` / `.Anger` / `.Poison` / `.Paralysis` / `.Bomb` / `.Stun` / `.Counter` | 被弾時の怯みフラグ（1 tick 限り） |
| `Mns.Temp.IsDamaged` | 怯み適用済み（同一被弾で複数適用を防ぐ） |
| `Mns.Temp.IsTurn` / `Mns.Temp.IsCombo` / `Mns.Temp.IsAlreadyAnimation` / `Mns.Temp.Anim.IsFirstContact` | 行動選択制御 |
| `Mns.Break.<Part>` / `Mns.Break.<Part>.Cut` | 部位破壊済み |
| `Mns.State.IsBattle` / `IsAnger` / `IsDown` / `IsStun` / `IsFlying` / `IsParalysis` / `Death` / `IsBlink` … | 状態（共通 `_index.d` で宣言済み） |
| `Anim.<技名>` | 行動選択で付け、`change/play/main` が消費 |
| `animated_java_<name>.<name>.animation.<anim>.playing` | AJ が管理する「再生中」タグ。`event/main` の判定に使う（**参照のみ**） |
| `Mns.Temp.IsIdleAnimation` / `Mns.Temp.IsSummonAnimation` | 召喚 / 乱入の初回アニメ種別 |

---

## 6. 作成手順チェックリスト（AI 向け）

1. **AJ エクスポート**: blueprint を Animated Java で `animated_java_<name>` 名前空間へエクスポートし、`data/animated_java_<name>/` と `pack.mcmeta` を生成。`pack.mcmeta` を §0.2 の書式に修正。
2. **`_index.d.mcfunction`**: Root / HitBox / 部位 / Candidate / Target / Temp.Damage / Break / 固有状態 / Anim タグを `#declare`。
3. **`load.mcfunction`**: `core/register` を呼ぶだけ。
4. **`core/register.mcfunction`**:
   - 固有スコア定義
   - `MonsterData` を Uid 付きで登録（§4.1。既存 remove → append）
   - `DefenceData` を肉質行コメント付きで登録（§4.2）
   - `AttackData` を `{Uid,Attacks:[]}` → 技ごと append（§4.3 新スキーマ）
5. **`mhdp_core` 側の連携**: `mhdp_core:monster_data` に Uid が既登録か確認。未登録ならクエスト定義（`ActiveQuest.Monsters` に入る Uid）や図鑑・素材テーブルへの追加が必要（更新時は既存 Uid をそのまま使う）。
6. **`core/summon/summon.mcfunction`** / **`core/summon/intrusion.mcfunction`**（§3.4）。
7. **`core/init/.mcfunction`**（§3.5。`super/init/` 呼び出し + ボスバー + 部位耐久計算 + 固有スコア 0 + 待機アニメ）。
8. **`core/remove/remove.mcfunction`**（§3.6）。
9. **`core/death/death.mcfunction`**（§3.7）。
10. **`core/damage/damage.mcfunction`**（§3.8。部位 ID → `Mns.Temp.Damage.<Part>`、怯み優先度）。
11. **`core/damage/reaction/*.mcfunction`**（§3.9。最低 `anger` / `counter` / `stun` + 部位ごと + `ambush`）。
12. **`core/damage/break/*.mcfunction`**（部位破壊のモデル変更・当たり判定 PartId 変更・トースト `show_toast`）。
13. **`core/tick/tick.mcfunction`** / **`core/tick/main.mcfunction`**（§3.10。ほぼ定型、`<name>` 置換のみ）。
14. **`core/tick/on_relax/*`** / **`on_caution/*`** / **`on_battle/*`**（§3.11–3.13。ranposu を雛形に、距離・FOV・加算値・"!" タグ名を調整）。
15. **`core/tick/on_battle/attack/<part>.mcfunction`** + **`attack/end.mcfunction`**（§3.13）。
16. **`core/tick/animation/change/main.mcfunction`** + **`on_relax|on_caution|on_battle/main`** + **`play/main`** + **`play/turn`**（§3.14。技ごとに `Anim.<技名>` → AJ アニメ名 のマッピング）。
17. **`core/tick/animation/event/main.mcfunction`**（§3.15。全アニメ分の `.playing` 判定行）。
18. **`core/tick/animation/event/<anim>/main|attack|end.mcfunction`**（§3.15。frame タイミングで効果音・移動・`start_attack.m` / `apply_attack.m` / `end_attack`、終端で `change/main`）。
19. **`core/util/fetch_player.mcfunction`** / **`apply_blink.mcfunction`** / **`end_blink.mcfunction`** / **`show_bossbar.mcfunction`** / **`show_toast.mcfunction`** / **`hide_toast.mcfunction`**（§3.16）。
20. **`core/util/models/*`** / **`core/util/phase/*`**（固有の見た目・部位状態がある場合）。
21. **`advancement/toast_break.json`**（§3.17。`item_model` を `icons/<name>` に）。
22. **`core/debug/interrupt.mcfunction`** / **`interrupt_anger.mcfunction`**（開発用。任意アニメ / 怒りを強制発火。`interrupt` は冒頭で実行者を Root に切り替え、`core/register` を呼んでから `Anim.<技名>` を付けて `change/main`）。
23. **検証**: `datapack enable` → 召喚 → 待機ループ → 発見 → 戦闘 → 各技の当たり判定 → 怯み / 部位破壊 / 怒り / スタン / 討伐 → `remove`。共通エンジンからの分岐に必要な §1 の関数がすべて存在することを確認。

---

## 7. 落とし穴 / 注意点

- **AJ アニメ再生 API**: `function animated_java_<name>:<name>/animations/<anim>/play`（頭出し再生）と `.../tween {duration:<t>, to_frame:<f>}`（補間して指定フレームへ）。`change/*` では `tween {duration:1, to_frame:1}` が定型。
- **`aj.<anim>.frame`** は AJ が毎 tick セットする。`event/<anim>/main` で `matches` 比較して使う。フレーム番号は blueprint のアニメーション長に依存するので、AJ 側のフレーム数を確認してから書く。
- **`event/main` の `.playing` タグ名**: `animated_java_<name>.<name>.animation.<anim>.playing`（`.` 区切り、AJ 名前空間ドット表記）。旧 valk の `aj.valk_aj.animation.<anim>.playing` とは異なる。
- **`super/init/` に計算を任せる**: HP・耐性・怒りパラメータを固有コードで計算し直さない。固有コードでやるのは「部位耐久値」と「固有カウントの 0 リセット」だけ。
- **怯みは 1 被弾 1 つ**: `reaction/*` の先頭で必ず共通処理を通し、末尾で `tag @s add Mns.Temp.IsDamaged`。優先度の並び順が挙動を決める。
- **`on_battle/attack/<part>` の先頭に `execute if entity @s[type=item_display] run return 1`**: これが無いと `start_attack.m` のエラー検知（`store success`）が誤検知して赤文字 tellraw が出る。
- **`intrusion` の未実装コピペに注意**: dino / ranposu のものは流用元が壊れている。実装するなら `summon` と同じ流れに直す。
- **`_index.d.mcfunction`** は実行されない。書いても挙動は変わらないが、Spyglass の警告抑制のため他パックと同水準で宣言する。

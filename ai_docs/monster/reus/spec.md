# 火竜（reus）内容仕様書

> `ai_docs/monster/create_new/monster_spec_template.md` 形式。一次情報源は [`creation_plan.md`](./creation_plan.md) §4 の回答（2026-10-25 時点）。
> 技・VFX・アニメーションイベントはユーザーが逐次指示 / 実装するため、§5・§6 は追加のたびに追記する。

---

## 1. 基本情報

| 項目 | 内容 |
|---|---|
| Uid | 1002（旧 reus から引き継ぎ） |
| 名前 | `name` = `reus` / `UpperName` = `Reus` |
| 名前空間 | `mhdp_monster_reus` / AJ: `animated_java_reus`（モデル名 `reus`。**未エクスポート**） |
| 表示名 / NameId | 火竜（Rathalos）/ `NameId` = `monster.rathalos.name`、`ShowName` = `{"translate":"monster.rathalos.name"}` |
| Icon | `uE012` |
| LootTable | `mhdp_items:materials/reus/random_all` |
| pack.mcmeta description | `For Monster Rathalos` |
| 移動属性 | 地上（飛行状態・形態変化なし） |
| 参考にする既存モンスター | dino（ステータス・行動選択・発見ロジックの仮値）、valk（共通処理のテンプレートの元） |

### 1.1 MonsterData ステータス（**全て仮値 = dino の値**）

| 項目 | 値 |
|---|---|
| `ShowHp` | true |
| `Hp` | 11000 |
| `StunDamage` / `TireDamage` | 200 / 300 |
| `AngerDamagePer` / `AngerTimer` / `AngerAttackMult` / `AngerSpeed` | 10 / 60 / 115 / 9 |
| `ParalysisDamage` / `ParalysisTimer` | 500 / 10 |
| `PoisonDamage` / `PoisonTimer` / `PoisonEffectDamage` | 400 / 17 / 60 |
| `BombDamage` / `BombEffectDamage` | 400 / 200 |
| `FlashBombEnable` / `SoundBombEnable` | true / false |
| `ParalyseTrapEnable` / `ParalyseTrapTimer` | true / 10 |
| `HallTrapEnable` / `HallTrapTimer` | true / 15 |
| `CounterDamage` | 75 |

---

## 2. 部位構成

翼は Minecraft の仕様上正確な当たり判定を作るのが難しいため、部位としては持たない。

| PartId | 部位名 | 肉質 [切,打,弾,火,水,雷,氷,龍] | `<Part>PartDamage` | 部位破壊 | 破壊内容 |
|---|---|---|---|---|---|
| 0 | Head | [70,75,62,0,15,25,10,30] | 12 | する | 頭のモデル差し替え |
| 1 | Body | [35,40,25,0,5,15,10,15] | 15 | する | 胴体のモデル差し替え |
| 2 | Tail | [50,40,35,0,5,20,10,25] | 15 | する | 切断 |
| 3 | LegR | [40,42,35,0,8,12,10,17] | 10 | しない | — |
| 4 | LegL | [40,42,35,0,8,12,10,17] | 10 | しない | — |

- 尻尾の切断片を object にするかは未定（技・VFX と同様に逐次指示）。
- 頭 HitBox には共通の `Mns.HitBox.Head` も付ける（スタン判定用）。"!" 表示も頭 HitBox に乗せる（dino と同じ）。

---

## 3. 状態・フェーズ

- 単一形態。固有の部位状態（dino の赤熱化など）は無し。
- 飛行状態は無し。ただし共通の `death_flying` アニメは用意する（Q-10）。
- 怒り: 共通の仕組み（`start_anger.m` / `end_anger.m`）。怒り時のモデル差し替えは無し。
- 怒り中演出: `pos_head` ロケータから火の粉パーティクル。
- 発見ロジック（relax / caution / battle の距離・視野角）: dino の値を仮値として使用。

---

## 4. 行動選択ロジック

- 距離帯・確率: dino の `change/on_battle/*` を参考にした仮値。
- 技はユーザーの指示で逐次追加する。

---

## 5. アニメーション一覧

### 5.1 共通ファイルが参照するアニメーション（Q-10）

| 用途 | アニメ名 |
|---|---|
| 非戦闘待機 | `idle_relax` |
| 戦闘待機 | `idle` |
| 非戦闘歩き | `walk_relax` |
| 生態行動 | `ecology_relax_short` / `ecology_relax_long`（dino と同じ） |
| 警戒（探索） | `search` |
| 発見時の咆哮 | `land_voice` |
| 怒り移行 | `land_anger` |
| 旋回 左 / 右 | `land_turn_l` / `land_turn_r` |
| 怯み | dino と同じ（`damage_head`、`damage_left` / `damage_right` など） |
| 相殺怯み | dino と同じ（`damage_counter_*_start`） |
| ダウン | dino と同じ（`damage_down_left` / `damage_down_right`） |
| 麻痺 | 未確認（dino には専用アニメ無し。ranposu = `state_paralysis_start`、valk = `state_paralysis`） |
| 討伐 / 飛行中の討伐 | `death` / `death_flying` |
| 乱入登場 | 無し（待機アニメで初期化。valk 方式） |

> AJ 未エクスポートのため、上記は**想定名**。エクスポート後に名前が違えば指摘してもらう。

### 5.2 技・アニメーションイベント

アニメーションイベント（`event/<anim>/*`）はユーザーが手動で実装する。技を追加するときは、ここに技名・AJ アニメ名・部位・属性を追記する。

| 技名（Name） | AJ アニメ名 | 左右 | 部位 | 属性 | 状態異常 | 備考 |
|---|---|---|---|---|---|---|
| （未定） | | | | | | |

---

## 6. VFX / 弾システム

- 逐次指示。ObjectId は `1002x` 帯を使う。

---

## 7. 部位破壊・特殊状態の演出

| 状態 | 差し替え item_model（想定） |
|---|---|
| まばたき | `head_upper` → `head_upper_blink` |
| 怒り | 変更しない |
| 部位破壊 | `head_upper_break` など（逐次追加。初期実装では作らない） |

---

## 8. サウンド

- 後日追加。

---

## 9. 既存モンスターからの流用方針

- 共通処理: valk ベースのテンプレート（`ai_docs/monster/template/mhdp_monster_template/`）。
- ステータス・発見ロジック・行動選択の仮値: dino。
- 建築物との相互作用（`on_search_object` / `cancel_attack_*`）: 逐次指示。

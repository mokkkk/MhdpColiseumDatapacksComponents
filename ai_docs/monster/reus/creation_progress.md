# `mhdp_monster_reus` 作成 進捗トラッカー

- 計画: [`creation_plan.md`](./creation_plan.md) / 仕様: [`spec.md`](./spec.md)
- セッションをまたいで再開する場合は「次に着手」から続ける。
- git commit はユーザーが手動で行う。Claude は commit 推奨タイミングを通知するのみ。
- 値は「仮値」「確定値」を区別して記録する。

## 次に着手

**Step 2 — テンプレート展開**（`ai_docs/monster/template/README.md` の展開手順に従い `datapacks/mhdp_monster_reus/` を生成）

## 確定事項（2026-10-25）

| 項目 | 内容 |
|---|---|
| name / Upper / Uid | `reus` / `Reus` / `1002` |
| テンプレート | `ai_docs/monster/template/mhdp_monster_template/**.tmpl`。区分 A / B / C を含める。ただし `event/<anim>/*`・`util/models/*`・`util/phase/*` は作らない |
| 部位 | Head(0) / Body(1) / Tail(2) / LegR(3) / LegL(4)。破壊: Head・Body（モデル差し替え）、Tail（切断） |
| 飛行 | 無し |
| AJ | 未エクスポート。共通ファイルは `spec.md` §5.1 の想定アニメ名で書く |
| 技 / object / 建築物相互作用 / event | ユーザーが逐次指示・実装。初期実装では作らない |

## 仮値一覧

| 対象 | 値 | 根拠 | 状態 |
|---|---|---|---|
| MonsterData ステータス一式 | dino と同じ | Q-06 | 仮値 |
| 発見ロジック（DistNear / DistFar / Fov） | dino と同じ | Q-18 | 仮値 |
| 行動選択の距離帯・確率 | dino と同じ | Q-17 | 仮値 |

## Step 進捗

- [x] Step 0 — 準備（計画への回答、本トラッカー、`spec.md`）
- [x] Step 1 — 共通テンプレート作成（58 ファイル + `ai_docs/monster/template/README.md`）
- [ ] Step 2 — テンプレート展開（reus の骨組み生成）
- [ ] Step 3 — reus 固有のデータ・被弾処理
- [ ] Step 4 — 行動選択（event 本体はユーザー実装）
- [ ] Step 5 — 仕上げ

## 作業ログ

- 2026-10-25: 計画の Q&A を確定。`spec.md` と本トラッカーを作成。
- 2026-10-25: Step 1 完了。テンプレートを作成。
  - `util/models/*` は不要との回答だったが、`anger_end` だけは共通エンジンの `end_anger.m` が必ず呼ぶため含めた（無いと怒りが解除されない）。
  - 存在しない関数を呼ぶ行（`event/main` の各行、`break/*` のモデル差し替え、`reaction/anger` の `anger_start`）はコメントアウトした状態で生成する方針。
  - 流用元のバグ（dino の paralysis が ranposu のアニメを呼ぶ、`IsAlreadyAnsimation` の誤字、`Mns.Dino.Target` タグ誤り）はテンプレート側で修正済み。dino 本体は未修正。

## 気付いた既存モンスターの不具合（未修正・参考）

| ファイル | 内容 |
|---|---|
| `mhdp_monster_dino/.../core/damage/reaction/paralysis` | `animated_java_ranposu:ranposu/animations/state_paralysis_start` を呼んでいる（dino の damage では麻痺行がコメントアウトされているため現状は未使用） |
| `mhdp_monster_dino/.../core/tick/animation/change/main` | `tag=!Mns.Temp.IsAlreadyAnsimation`（誤字）。戦闘時は Anim タグが既にあっても on_battle/main が走る |
| `mhdp_monster_dino/.../change/on_battle/near`・`far` | `check_player_situation.m {Tag:"Mns.Dino.Target"}`（正しくは `Mns.Target.Dino`） |

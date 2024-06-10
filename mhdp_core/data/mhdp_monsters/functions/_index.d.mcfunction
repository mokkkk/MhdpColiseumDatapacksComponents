#> mhdp_monsters:_index.d
# @private

#> tag
# @within function mhdp_monsters:/**

## tag
# モンスター関連・パラメータ初期化用
    #declare tag Mns.Param.IsHideHp Hp非表示
    #declare tag Mns.Param.IsStunEnable スタン有効
    #declare tag Mns.Param.IsTireEnable 減気有効
    #declare tag Mns.Param.IsParalysisEnable 麻痺有効
    #declare tag Mns.Param.IsPoisonEnable 毒有効
    #declare tag Mns.Param.IsFlashBombEnable 閃光玉有効共通タグ
    #declare tag Mns.Param.IsFlashBombEnable.Temp 現時点で閃光玉が有効かどうか
    #declare tag Mns.Param.IsSoundBombEnable 音爆弾有効共通タグ
    #declare tag Mns.Param.IsSoundBombEnable.Temp 現時点で音爆弾が有効かどうか
    #declare tag Mns.Param.IsParalyseTrapEnable 痺れ罠有効共通タグ
    #declare tag Mns.Param.IsParalyseTrapEnable.Temp 現時点で痺れ罠が有効かどうか
    #declare tag Mns.Param.IsHallTrapEnable 落とし穴有効共通タグ
    #declare tag Mns.Param.IsHallTrapEnable.Temp 現時点で落とし穴が有効かどうか
# モンスター関連
    #declare tag Mns.Root モンスターのRootエンティティ共通タグ
# 当たり判定関連(Slime)
    #declare tag Mns.HitBox モンスターの当たり判定の共通タグ
    #declare tag Mns.HitBox.Init 初期化処理済みの当たり判定

## score_holder
    #declare score_holder #mhdp_temp_player_count クエスト参加プレイヤー数
    #declare score_holder #mhdp_temp_hp_multiply_quest クエストによるHP倍率
    #declare score_holder #mhdp_temp_hp_multiply_playercount プレイヤー数に対するHP倍率

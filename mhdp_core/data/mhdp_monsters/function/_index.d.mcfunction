#> mhdp_monsters:_index.d
# @private

#> tag
# @within function mhdp_monsters:/**

## tag
# モンスター関連・パラメータ初期化用
    #declare tag Mns.Param.IsHardcore ハードコアモード有効
    #declare tag Mns.Param.IsHideHp Hp非表示
    #declare tag Mns.Param.IsStunEnable スタン有効
    #declare tag Mns.Param.IsTireEnable 減気有効
    #declare tag Mns.Param.IsParalysisEnable 麻痺有効
    #declare tag Mns.Param.IsPoisonEnable 毒有効
    #declare tag Mns.Param.IsBombEnable 爆破有効
    #declare tag Mns.Param.IsFlashBombEnable 閃光玉有効共通タグ
    #declare tag Mns.Param.IsSoundBombEnable 音爆弾有効共通タグ
    #declare tag Mns.Param.IsParalyseTrapEnable 痺れ罠有効共通タグ
    #declare tag Mns.Param.IsHallTrapEnable 落とし穴有効共通タグ
# モンスター関連・共通
    #declare tag Mns.Root モンスターのRootエンティティ共通タグ
# モンスター関連・一時
    #declare tag Mns.Temp.IsIdleAnimation 待機アニメーションを再生する
    #declare tag Mns.Temp.IsSummonAnimation 登場アニメーションを再生する
# モンスター関連・状態
    #declare tag Mns.State.IsAnger 怒り中
    #declare tag Mns.State.IsDown ダウン中
    #declare tag Mns.State.IsStun スタン中
    #declare tag Mns.State.IsTrap 罠効果時間中
    #declare tag Mns.State.IsDisableFlashBomb 一時的に閃光玉無効
    #declare tag Mns.State.IsDisableSoundBomb 一時的に音爆弾無効
    #declare tag Mns.State.IsDisableParalyseTrap 一時的に痺れ罠無効
    #declare tag Mns.State.IsDisableHallTrap 一時的に落とし穴無効
# 当たり判定関連(Slime)
    #declare tag Mns.HitBox モンスターの当たり判定の共通タグ
    #declare tag Mns.HitBox.Init 初期化処理済みの当たり判定
    #declare tag Mns.HitBox.Head 頭部の当たり判定

## score_holder
    #declare score_holder #mhdp_temp_player_count クエスト参加プレイヤー数
    #declare score_holder #mhdp_temp_hp_multiply_quest クエストによるHP倍率
    #declare score_holder #mhdp_temp_hp_multiply_playercount プレイヤー数に対するHP倍率

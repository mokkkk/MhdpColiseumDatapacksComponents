#> mhdp_items:_index.d
# @private

#> tag
# @within function mhdp_items:/**

## storage

## score_holder
# 共通処理
    #declare score_holder #mhdp_temp_index 再帰処理のindexに使用
    #declare score_holder #mhdp_temp_sum 再帰処理のsumに使用
    #declare score_holder #mhdp_temp_sharpness_current 現在斬れ味の計算用
# 一時
    #declare score_holder #mhdp_arg_cmd_offset cmdのオフセットを設定

## tag
# プレイヤー
    # 状態
        #declare tag Ply.Weapon.Deactivated 武器操作無効化状態
        #declare tag Ply.Weapon.StaminaNotRegen スタミナ回復無効化状態
        #declare tag Ply.Weapon.StaminaEmpty スタミナ使い切り状態
        #declare tag Ply.Weapon.Drawing 抜刀中
        #declare tag Ply.Weapon.Drawing.Sub サブ武器抜刀中
        #declare tag Ply.Weapon.NoOpe 立ち状態（非操作中）
        #declare tag Ply.Weapon.NoAvoid 回避不能
        #declare tag Ply.Weapon.NoMoveJump 移動ジャンプ不能
        #declare tag Ply.Weapon.Guard ガード中
        #declare tag Ply.Weapon.Armod.Super スーパーアーマー中
        #declare tag Ply.Weapon.Armod.Hyper ハイパーアーマー中
        #declare tag Ply.Weapon.HisStop ヒットストップ中
    # 操作モード
        #declare tag Ply.Weapon.Type.Tech 天の型
    # 装備武器
        #declare tag Ply.Weapon.Equip.GreatSword 大剣装備
        #declare tag Ply.Weapon.Equip.ShortSword 片手剣装備
        #declare tag Ply.Weapon.Equip.Bow 弓装備
    # フラグ
        #declare tag Ply.Flag.HideSharpness 斬れ味UI非表示フラグ
        #declare tag Ply.Flag.NormalAttack 左クリック攻撃フラグ
        #declare tag Ply.Flag.NormalSheathe 通常納刀フラグ
        #declare tag Ply.Flag.DrawAttack 抜刀攻撃フラグ
        #declare tag Ply.Flag.Hit 武器攻撃命中フラグ
        #declare tag Ply.Flag.Counter カウンター成功フラグ
        #declare tag Ply.Flag.SpJumpAttack 特殊空中攻撃フラグ
    # オプション
        #declare tag Ply.Option.DisableCameraEffect オプション：画面効果無効化
# 一時
    #declare tag Temp.Hit ヒット判定用
    #declare tag Temp.Victim 攻撃対象判定用

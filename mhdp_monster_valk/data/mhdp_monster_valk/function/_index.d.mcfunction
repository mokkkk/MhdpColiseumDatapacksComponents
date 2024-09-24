#> mhdp_monster_valk:_index.d
# @private

#> tag
# @within function mhdp_monster_valk:/**

## tag
# item_display
    #declare tag Mns.Root.Valk 天彗龍Rootエンティティ
# 当たり判定
    #declare tag Mns.HitBox.Valk 斬竜当たり判定スライム
    #declare tag Mns.HitBox.Valk.Head 頭
    #declare tag Mns.HitBox.Valk.Body 胴
# 状態
    #declare tag Mns.Valk.State.IsShoot 龍気形態
# 一時
    #declare tag Mns.Temp.Damage.Head 頭怯み
    #declare tag Mns.Temp.Damage.Body 胴怯み
    #declare tag Mns.Temp.Damage.Tail 尻尾怯み
    #declare tag Mns.Temp.Damage.LegR 右足怯み
    #declare tag Mns.Temp.Damage.LegL 左足怯み
    #declare tag Mns.Temp.Valk.MoveToSpin 移動から回転攻撃に移行
    #declare tag Mns.Temp.Valk.MoveToDashAttack 移動から突進に移行
    #declare tag Mns.Temp.Valk.MoveToChangePhase 移動から変形に移行
    #declare tag Mns.Temp.Valk.StepToVertical.R ステップから叩きつけに移行
    #declare tag Mns.Temp.Valk.StepToVertical.L ステップから叩きつけに移行
    #declare tag Mns.Temp.Valk.StepToBombSide ステップから側面爆発に移行
    #declare tag Mns.Temp.Valk.EndFlyTackle 滑空突進終了
# プレイヤー
    #declare tag Mns.Target.Valk 現在狙っているプレイヤー
# 部位破壊
    #declare tag Mns.Break.Head 頭部位破壊
    #declare tag Mns.Break.Tail 尻尾部位破壊
    #declare tag Mns.Break.Wing.R 右翼部位破壊
    #declare tag Mns.Break.Wing.L 左翼部位破壊
# アニメーション

# その他Entity
    # 発射物
        #declare tag Mns.Shot.Valk 天彗龍の弾全般
        #declare tag Mns.Shot.Valk.Tail 切断後の尻尾
    # 攻撃位置
        #declare tag Mns.MovePos.Valk 移動位置
        #declare tag Mns.ShotPos.Valk 射撃攻撃位置

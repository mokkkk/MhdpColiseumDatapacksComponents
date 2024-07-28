#> mhdp_monster_reus:_index.d
# @private

#> tag
# @within function mhdp_monster_reus:/**

## tag
# item_display
    #declare tag Mns.Root.Reus 火竜Rootエンティティ
# 当たり判定
    #declare tag Mns.HitBox.Reus 火竜当たり判定スライム
    #declare tag Mns.HitBox.Reus.Head 頭
    #declare tag Mns.HitBox.Reus.Body 胴
# 状態
    #declare tag Mns.Reus.State.Flying 飛行形態
# 一時
    #declare tag Mns.Temp.Damage.Head 頭怯み
    #declare tag Mns.Temp.Damage.Body 胴怯み
    #declare tag Mns.Temp.Damage.Tail 尻尾怯み
    #declare tag Mns.Temp.Damage.LegR 右足怯み
    #declare tag Mns.Temp.Damage.LegL 左足怯み
# プレイヤー
    #declare tag Mns.Target.Reus 現在狙っているプレイヤー
# 部位破壊
    #declare tag Mns.Break.Head 頭部位破壊
    #declare tag Mns.Break.Tail 尻尾部位破壊
# アニメーション
    #declare tag Anim.Idle
    #declare tag Anim.Turn.R
    #declare tag Anim.Turn.L
    #declare tag Anim.Voice
    #declare tag Anim.Bite
    #declare tag Anim.ChargeBite

# その他Entity
    # 発射物
        #declare tag Mns.Shot.Reus 火竜の弾全般
        #declare tag Mns.Shot.Reus.Breath 火炎弾
        #declare tag Mns.Shot.Reus.Tail 切断後の尻尾
    # 攻撃位置
        #declare tag Mns.ShotPos.Reus 射撃攻撃位置

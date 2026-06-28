#> mhdp_monster_dino:_index.d
# @private

#> tag
# @within function mhdp_monster_dino:/**

## tag
# item_display
    #declare tag Mns.Root.Dino 斬竜Rootエンティティ
# 当たり判定
    #declare tag Mns.HitBox.Dino 斬竜当たり判定スライム
    #declare tag Mns.HitBox.Dino.Head 頭
    #declare tag Mns.HitBox.Dino.Body 胴
    #declare tag Mns.HitBox.Dino.LegR 右脚
    #declare tag Mns.HitBox.Dino.LegL 左脚
    #declare tag Mns.HitBox.Dino.Tail 尻尾
# 一時
    #declare tag Mns.Temp.Damage.Head 頭怯み
    #declare tag Mns.Temp.Damage.Body 胴怯み
    #declare tag Mns.Temp.Damage.Tail 尻尾怯み
    #declare tag Mns.Temp.Damage.LegR 右足怯み
    #declare tag Mns.Temp.Damage.LegL 左足怯み
    #declare tag Mns.Dino.Temp.ToBite 移動から噛みつきに遷移する
    #declare tag Mns.Dino.Temp.ToTail 移動から尻尾叩きつけに遷移する
# プレイヤー
    #declare tag Mns.Candidate.Dino ターゲット候補になるプレイヤー
    #declare tag Mns.Target.Dino 現在狙っているプレイヤー
# 部位破壊
    #declare tag Mns.Break.Head 頭部位破壊
    #declare tag Mns.Break.Tail 尻尾部位破壊
    #declare tag Mns.Break.Tail.Cut 尻尾部位破壊・切断

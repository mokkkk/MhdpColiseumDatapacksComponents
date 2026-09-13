#> mhdp_monster_valk:_index.d
# @private

#> tag
# @within function mhdp_monster_valk:/**

## tag
# item_display
    #declare tag Mns.Root.Valk 天彗龍Rootエンティティ
# 当たり判定
    #declare tag Mns.HitBox.Valk 天彗龍当たり判定スライム
    #declare tag Mns.HitBox.Valk.Head 頭
    #declare tag Mns.HitBox.Valk.Body 胴
    #declare tag Mns.HitBox.Valk.Tail 尻尾
    #declare tag Mns.HitBox.Valk.ArmR 右腕
    #declare tag Mns.HitBox.Valk.ArmL 左腕
    #declare tag Mns.HitBox.Valk.LegR 右脚
    #declare tag Mns.HitBox.Valk.LegL 左脚
    #declare tag Mns.HitBox.Valk.WingR 右翼
    #declare tag Mns.HitBox.Valk.WingL 左翼
# 状態
    #declare tag Mns.Valk.State.IsShoot 龍気形態
    #declare tag Mns.Valk.State.Attack.Head 頭攻撃中(相殺アニメ分岐用)
    #declare tag Mns.Valk.State.Attack.Wing.R 右翼爪攻撃中(相殺アニメ分岐用)
    #declare tag Mns.Valk.State.Attack.Wing.L 左翼爪攻撃中(相殺アニメ分岐用)
# 一時
    #declare tag Mns.Temp.Right 対象が右側にいる(アニメ左右分岐用)
    #declare tag Mns.Temp.Forward 対象が正面にいる(行動選択用)
    #declare tag Mns.Temp.Back 対象が背面にいる(行動選択用)
    #declare tag Mns.Temp.Near 対象が近距離(行動選択用)
    #declare tag Mns.Temp.IsUpper アッパー派生(翼槍叩きつけ)
    #declare tag Mns.Temp.ChangePhase フェーズ移行フラグ
    #declare tag Mns.Temp.IsTurn.Big 大きな軸合わせ
    #declare tag Mns.Valk.Temp.Tail.Break 尻尾切断怯みアニメ用
    #declare tag Mns.Temp.Damage.Head 頭怯み
    #declare tag Mns.Temp.Damage.Body 胴怯み
    #declare tag Mns.Temp.Damage.Tail 尻尾怯み
    #declare tag Mns.Temp.Damage.ArmR 右腕怯み
    #declare tag Mns.Temp.Damage.ArmL 左腕怯み
    #declare tag Mns.Temp.Damage.LegR 右足怯み
    #declare tag Mns.Temp.Damage.LegL 左足怯み
    #declare tag Mns.Temp.Damage.WingR 右翼怯み
    #declare tag Mns.Temp.Damage.WingL 左翼怯み
    #declare tag Mns.Temp.Damage.BodySp 胸怯み(吸引中)
    #declare tag Mns.Temp.Valk.MoveToSpin 移動から回転攻撃に移行
    #declare tag Mns.Temp.Valk.MoveToDashAttack 移動から突進に移行
    #declare tag Mns.Temp.Valk.MoveToChangePhase 移動から変形に移行
    #declare tag Mns.Temp.Valk.StepToVertical.R ステップから叩きつけに移行
    #declare tag Mns.Temp.Valk.StepToVertical.L ステップから叩きつけに移行
    #declare tag Mns.Temp.Valk.StepToBombSide ステップから側面爆発に移行
    #declare tag Mns.Temp.Valk.EndFlyTackle 滑空突進終了
# プレイヤー
    #declare tag Mns.Candidate.Valk ターゲット候補になるプレイヤー
    #declare tag Mns.Target.Valk 現在狙っているプレイヤー
# 部位破壊
    #declare tag Mns.Break.Head 頭部位破壊
    #declare tag Mns.Break.Tail 尻尾部位破壊
    #declare tag Mns.Break.Tail.Cut 尻尾切断
    #declare tag Mns.Break.Wing.R 右翼部位破壊
    #declare tag Mns.Break.Wing.L 左翼部位破壊
    #declare tag Mns.Break.Arm.R 右腕部位破壊
    #declare tag Mns.Break.Arm.L 左腕部位破壊
# アニメーション
    #declare tag Anim.Voice 咆哮
    #declare tag Anim.Charge 龍気吸引
    #declare tag Anim.Change.LanceToShoot 変形 彗龍→龍気
    #declare tag Anim.Change.ShootToLance 変形 龍気→彗龍
    #declare tag Anim.MoveBack 車庫入れ
    #declare tag Anim.MoveStart.Lance 移動(彗龍)
    #declare tag Anim.MoveStart.Shoot 移動(龍気)
    #declare tag Anim.Spear.RtoL 2連突き R→L
    #declare tag Anim.Spear.LtoR 2連突き L→R
    #declare tag Anim.Spear.RtoSpin 翼槍回転斬り R
    #declare tag Anim.Spear.LtoSpin 翼槍回転斬り L
    #declare tag Anim.Vertical.R 翼槍叩きつけ R
    #declare tag Anim.Vertical.L 翼槍叩きつけ L
    #declare tag Anim.Vertical.Turn.R 振りむき翼槍叩きつけ R
    #declare tag Anim.Vertical.Turn.L 振りむき翼槍叩きつけ L
    #declare tag Anim.Upper.R 翼槍振り上げ R
    #declare tag Anim.Upper.L 翼槍振り上げ L
    #declare tag Anim.Bite 噛みつき
    #declare tag Anim.DashAttack 突進攻撃
    #declare tag Anim.Tackle 蛇行突進
    #declare tag Anim.JetTackle 滑空突進
    #declare tag Anim.Beam 龍閃
    #declare tag Anim.Comet 彗星
    #declare tag Anim.Step ステップ(龍気)
    #declare tag Anim.VerticalS.R 翼叩きつけ R
    #declare tag Anim.VerticalS.L 翼叩きつけ L
    #declare tag Anim.Sweep.R 薙ぎ払い R
    #declare tag Anim.Sweep.L 薙ぎ払い L
    #declare tag Anim.Shoot.F 射撃 前方
    #declare tag Anim.Shoot.H 射撃 水平
    #declare tag Anim.Bomb.Forward 前方爆発
    #declare tag Anim.Bomb.Side 側面爆発
    #declare tag Anim.Sault 前転
    #declare tag Anim.Search 警戒 索敵
    #declare tag Anim.Ecology 生態行動
    #declare tag Anim.RelaxWalk 未発見 歩き
    #declare tag Anim.Turn.R 振り向き R
    #declare tag Anim.Turn.L 振り向き L

# その他Entity
    # 発射物・VFX は assets:object/1004x.valk_* へ移行済み（Mns.Shot.Valk* タグは廃止。10047.Long 等の object 側タグを使用）
    # 攻撃位置マーカー（アニメイベントが area_effect_cloud を ad-hoc 召喚する際に使用）
        #declare tag Mns.MovePos.Valk 移動位置
        #declare tag Mns.ShotPos.Valk 射撃攻撃位置

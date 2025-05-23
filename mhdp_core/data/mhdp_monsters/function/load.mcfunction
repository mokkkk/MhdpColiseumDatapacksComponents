#> mhdp_monsters:load
#
# モンスター処理用のスコア定義
#
# @within function mhdp_items:/**

## Scoreboard定義
# モンスター処理用
    # メイン
        # メイン処理用
            scoreboard objectives add Mns.General.AnimationTimer dummy
        # 連続行動回数(威嚇用)
            scoreboard objectives add Mns.General.ActCount.Idle dummy
        # 連続行動回数(ターゲット更新用)
            scoreboard objectives add Mns.General.ActCount.Target dummy
        # 連続行動回数(位置リセット用)
            scoreboard objectives add Mns.General.ActCount.Move dummy
        # プレイヤー発見までの時間
            scoreboard objectives add Mns.General.SearchTimer dummy
        # 連続軸合わせ回数
            scoreboard objectives add Mns.General.TurnCount dummy
        # ダウンのもがき回数
            scoreboard objectives add Mns.General.DownCount dummy
        # 同士討ちの無敵時間
            scoreboard objectives add Mns.General.DamageInterval dummy
        # まばたき処理用
            scoreboard objectives add Mns.General.BlinkTimer.Check dummy
            scoreboard objectives add Mns.General.BlinkTimer dummy
        # 討伐後の消滅時間
            scoreboard objectives add Mns.General.RemoveTimer dummy
        # メイン処理用(Dummy)
            scoreboard objectives add Mns.General.DummyTimer dummy
            scoreboard objectives add Mns.General.DummyCounter dummy
    # パラメータ系
        # 実体力
            scoreboard objectives add Mns.Hp dummy
        # 実体力半分
            scoreboard objectives add Mns.Hp.Half dummy
        # 怒り耐性値
            scoreboard objectives add Mns.Anger.Damage dummy
            scoreboard objectives add Mns.Anger.Damage.Max dummy
        # 怒り継続時間
            scoreboard objectives add Mns.Anger.Timer dummy
            scoreboard objectives add Mns.Anger.Timer.Max dummy
        # 怒り中の攻撃力倍率
            scoreboard objectives add Mns.Anger.AttackMutiply dummy
        # 怒り中の行動速度上昇値
            scoreboard objectives add Mns.Anger.Speed dummy
        # スタン耐性値
            scoreboard objectives add Mns.Stun.Damage dummy
            scoreboard objectives add Mns.Stun.Damage.Max dummy
        # 減気耐性値
            scoreboard objectives add Mns.Tire.Damage dummy
            scoreboard objectives add Mns.Tire.Damage.Max dummy
        # 麻痺耐性値
            scoreboard objectives add Mns.Paralysis.Damage dummy
            scoreboard objectives add Mns.Paralysis.Damage.Max dummy
        # 麻痺継続時間
            scoreboard objectives add Mns.Paralysis.Timer dummy
            scoreboard objectives add Mns.Paralysis.Timer.Max dummy
        # 毒耐性値
            scoreboard objectives add Mns.Poison.Damage dummy
            scoreboard objectives add Mns.Poison.Damage.Max dummy
        # 毒継続時間
            scoreboard objectives add Mns.Poison.Timer dummy
            scoreboard objectives add Mns.Poison.Timer.Max dummy
            scoreboard objectives add Mns.Poison.Timer.Sub dummy
        # 毒効果ダメージ
            scoreboard objectives add Mns.Poison.Effect.Value dummy
        # 爆破耐性値
            scoreboard objectives add Mns.Bomb.Damage dummy
            scoreboard objectives add Mns.Bomb.Damage.Max dummy
        # 爆破効果ダメージ
            scoreboard objectives add Mns.Bomb.Effect.Value dummy
        # 龍気耐性値
            scoreboard objectives add Mns.DragonAura.Damage dummy
            scoreboard objectives add Mns.DragonAura.Damage.Max dummy
        # 相殺耐性値
            scoreboard objectives add Mns.Counter.Damage dummy
            scoreboard objectives add Mns.Counter.Damage.Max dummy
        # 痺れ罠効果時間
            scoreboard objectives add Mns.ParalyseTrap.Timer dummy
            scoreboard objectives add Mns.ParalyseTrap.Timer.Max dummy
        # 落とし穴効果時間
            scoreboard objectives add Mns.HallTrap.Timer dummy
            scoreboard objectives add Mns.HallTrap.Timer.Max dummy
    # その他
        # 閃光玉耐性時間
            scoreboard objectives add Mns.General.FlashBomb.ResistTimer dummy
        # 剝ぎ取り可能回数
            scoreboard objectives add Mns.General.Carving.Count dummy

# 当たり判定処理用
    # モンスターUid
        scoreboard objectives add Mns.HitBox.MonsterUid dummy
    # 部位Id
        scoreboard objectives add Mns.Hitbox.PartId dummy
    # 発射物のタイマー
        scoreboard objectives add Mns.Shot.Timer dummy

# 一時的処理用
    # 回転速度
        scoreboard objectives add Mns.Temp.RotateVec dummy
    # 移動速度
        scoreboard objectives add Mns.Temp.MoveVec.X dummy
        scoreboard objectives add Mns.Temp.MoveVec.Y dummy
        scoreboard objectives add Mns.Temp.MoveVec.Z dummy
    # 怒り中行動速度上昇計算用タイマー
        scoreboard objectives add Mns.Temp.AngerSpeed.Timer dummy

# 定数
    # プレイヤー数に対するHP倍率
        scoreboard players set #const_hp_playercount_multiply Const 40
    # 耐性初期値
        # 龍気耐性
            scoreboard players set #const_dragonaura_damage_initial_value Const 3000
    # 耐性上昇割合
        # スタン耐性上昇割合
            scoreboard players set #const_stun_damage_multiply Const 180
        # 減気耐性上昇割合
            scoreboard players set #const_tire_damage_multiply Const 180
        # 毒耐性上昇割合
            scoreboard players set #const_poison_damage_multiply Const 160
        # 麻痺耐性上昇割合
            scoreboard players set #const_paralysis_damage_multiply Const 180
        # 爆破耐性上昇割合
            scoreboard players set #const_bomb_damage_multiply Const 140
        # 龍気耐性上昇割合
            scoreboard players set #const_dragonaura_damage_multiply Const 180
        # 相殺耐性上昇割合
            scoreboard players set #const_counter_damage_multiply Const 200
        # 痺れ罠効果時間減少割合
            scoreboard players set #const_paralyse_trap_time_multiply Const 70
        # 落とし穴効果時間減少割合
            scoreboard players set #const_hall_trap_time_multiply Const 70

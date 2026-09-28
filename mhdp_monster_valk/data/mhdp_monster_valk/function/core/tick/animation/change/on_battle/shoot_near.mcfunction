#> mhdp_monster_valk:core/tick/animation/change/on_battle/shoot_near
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Target.Valk"}

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Vertical:2,Sweep:2,BombForward:1,BombSide:2}
# 状態に応じた確率上書き
    # 正面時
        execute if entity @a[tag=Mns.Target.Valk,tag=Mns.Temp.Situation.IsForward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sweep:3}
    # 側面時
        execute if entity @a[tag=Mns.Target.Valk,tag=!Mns.Temp.Situation.IsForward,tag=!Mns.Temp.Situation.IsBack] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BombSide:4}
    # 怒り時
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Sweep:3}
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {BombForward:0}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"valk",State:"shoot_near"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 翼叩きつけ
        execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/vertical_s
    # 薙ぎ払い
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/sweep
    # 前方爆発
        execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bomb.Forward
    # 側面爆発
        execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_valk:core/tick/animation/change/play/bomb_side

# クールタイム設定
    execute if entity @s[tag=Anim.Bomb.Forward] run scoreboard players set @s Mns.Valk.MoveSkill.CoolDown 3

# 軸合わせ要否確認
    function mhdp_monster_valk:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore

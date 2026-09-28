#> mhdp_monster_valk:core/tick/animation/change/on_battle/lance_near
#
# 行動ランダム選択
#
# @within function mhdp_monster_valk:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Target.Valk"}

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Spear:2,Vertical:2,Bite:0,DashAttack:0,Tackle:2,FlyTackle:1}
# 状態に応じた確率上書き
    # 正面時
        execute if entity @a[tag=Mns.Target.Valk,tag=Mns.Temp.Situation.IsForward] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:3,DashAttack:2}
    # 背面時
        execute if entity @a[tag=Mns.Target.Valk,tag=Mns.Temp.Situation.IsBack] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Vertical:3}
    # クールタイム
        execute if score @s Mns.Valk.MoveSkill.CoolDown matches 1.. run data modify storage mhdp_core:temp Temp.AttackRandom merge value {FlyTackle:0}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"valk",State:"lance_near"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 2連突き
        execute if score #mndp_temp_action_id MhdpCore matches 1 run function mhdp_monster_valk:core/tick/animation/change/play/spear
    # 翼槍叩きつけ
        execute if score #mndp_temp_action_id MhdpCore matches 2 run function mhdp_monster_valk:core/tick/animation/change/play/vertical
    # 噛みつき
        execute if score #mndp_temp_action_id MhdpCore matches 3 run tag @s add Anim.Bite
    # 突進攻撃
        execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_valk:core/tick/animation/change/play/dashattack_move
    # 蛇行突進
        execute if score #mndp_temp_action_id MhdpCore matches 5 run tag @s add Anim.Tackle
    # 滑空突進
        execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_valk:core/tick/animation/change/play/jet_tackle

# 軸合わせ要否確認
    function mhdp_monster_valk:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore

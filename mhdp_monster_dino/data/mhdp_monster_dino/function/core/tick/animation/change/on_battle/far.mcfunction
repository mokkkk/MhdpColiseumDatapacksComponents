#> mhdp_monster_dino:core/tick/animation/change/on_battle/far
#
# 行動ランダム選択
#
# @within function mhdp_monster_dino:core/tick/animation/change/random/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Dino.Target"}

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Breath:0,BreathTriple:0,BreathMove:0,MoveBite:3,MoveTail:2,TailJump:3}
    # 通常・正面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 通常・背面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 通常・側面時
        execute if entity @a[tag=Mns.Target.Dino,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailJump:4}
    # 喉赤熱化
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {Breath:4,BreathTriple:3,BreathMove:4}
    # 尻尾赤熱化
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run data modify storage mhdp_core:temp Temp.AttackRandom merge value {TailJump:4}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"dino",State:"far"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # ブレス
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Breath.Back
    # 3連ブレス
        execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.Breath.Triple
    # 移動ブレス
        execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_dino:core/tick/animation/change/play/move_breath
    # 移動→2連嚙みつき
        execute if score #mndp_temp_action_id MhdpCore matches 4 run function mhdp_monster_dino:core/tick/animation/change/play/move_to_bite
    # 移動→尻尾攻撃
        execute if score #mndp_temp_action_id MhdpCore matches 5 run function mhdp_monster_dino:core/tick/animation/change/play/move_to_tail
    # 尻尾攻撃・飛びかかり
        execute if score #mndp_temp_action_id MhdpCore matches 6 run function mhdp_monster_dino:core/tick/animation/change/play/tail_jump

# 軸合わせ要否確認
    function mhdp_monster_dino:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore

#> mhdp_monster_ranposu:core/tick/animation/change/random/middle
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/random/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Ranposu.Target"}

# 確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Move:3,Jump:4,StepJump:0}
    # 正面
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 背面
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 怒り
        execute if entity @s[tag=Mns.State.IsAnger] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {StepJump:5}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"ranposu",State:"middle"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 移動
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Move
    # 急襲
        execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.Jump
    # 回り込み急襲
        execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump

# 軸合わせ要否確認
    function mhdp_monster_ranposu:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore

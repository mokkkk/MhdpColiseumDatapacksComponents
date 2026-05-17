#> mhdp_monster_ranposu:core/tick/animation/change/on_battle/near
#
# 行動ランダム選択
#
# @within function mhdp_monster_ranposu:core/tick/animation/change/on_battle/main

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Mns.Candidate.Target"}

# 基礎確率設定
    data modify storage mhdp_core:temp Temp.AttackRandom set value {Bite:3,BiteStrong:3,Tail:3,MoveClaw:4,Tackle:3,BackStep:2,StepJump:0}
# 状態に応じた確率上書き
    # 正面時
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsForward] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Bite:5,Tail:1,MoveClaw:4,Tackle:4}
    # 背面時
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {}
    # 側面時
        execute if entity @a[tag=Mns.Target.Ranposu,tag=Mns.Temp.Situation.IsForward,tag=Mns.Temp.Situation.IsBack] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {Tail:5}
    # 怒り時
        execute if entity @s[tag=Mns.State.IsAnger] run \
            data modify storage mhdp_core:temp Temp.AttackRandom merge value {StepJump:4}

# 決定
    function mhdp_monsters:core/util/tick/animation/decide_animation.m {Monster:"ranposu",State:"near"}

# 状態リセット
    data remove storage mhdp_core:temp Temp.AttackRandom
    function mhdp_monsters:core/util/tick/animation/remove_tag

# Animタグ付与
    # 噛みつき
        execute if score #mndp_temp_action_id MhdpCore matches 1 run tag @s add Anim.Bite
    # 強嚙みつき
        execute if score #mndp_temp_action_id MhdpCore matches 2 run tag @s add Anim.BiteStrong
    # 尻尾攻撃
        execute if score #mndp_temp_action_id MhdpCore matches 3 run function mhdp_monster_ranposu:core/tick/animation/change/play/tail
    # 移動ひっかき
        execute if score #mndp_temp_action_id MhdpCore matches 4 run tag @s add Anim.MoveClaw
    # タックル
        execute if score #mndp_temp_action_id MhdpCore matches 5 run tag @s add Anim.Tackle
    # バックステップ
        execute if score #mndp_temp_action_id MhdpCore matches 6 run tag @s add Anim.BackStep
    # 回り込み急襲
        execute if score #mndp_temp_action_id MhdpCore matches 7 run function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump

# 軸合わせ要否確認
    function mhdp_monster_ranposu:core/tick/animation/change/on_battle/turn

# 終了
    scoreboard players reset #mndp_temp_action_id MhdpCore

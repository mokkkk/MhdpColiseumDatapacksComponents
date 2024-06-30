#> mhdp_monster_ranposu:core/tick/animation/change/interrupt
#
# アニメーション処理 割り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# タグ付与
    # tag @s add Anim.StepJump.L
    function mhdp_monster_ranposu:core/tick/animation/change/play/step_jump

# 軸合わせ
    # tag @s add Mns.Temp.IsTurn
    scoreboard players set @s Mns.General.TurnCount 2

# アニメーション変更
    function mhdp_monster_ranposu:core/tick/animation/change/main

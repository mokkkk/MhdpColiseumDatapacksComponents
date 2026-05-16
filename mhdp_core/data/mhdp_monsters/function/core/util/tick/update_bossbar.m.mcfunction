#> mhdp_monsters:core/util/tick/update_bossbar.m
# 
# 汎用処理 ボスバー名表示変更
#
# @input arg Monster モンスター名
# @input arg State 状態。relax,caution,battle,angerから選択

# ボスバー名更新
    $bossbar set mhdp_monster:$(Monster) name [{"translate":"monster.$(Monster).name",shadow_color:[0,0,0,1]},{"text":" "},{"translate":"monster.general.eye.$(State)","font":"minecraft:ui/monster_hp",shadow_color:[0,0,0,0]}]

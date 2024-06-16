#> mhdp_items:items/macro/m.fix_eat_seconds
#
# アイテム使用時の共通処理
#
# @within function mhdp_items:/**

# functionを取得し、実行する
    $item modify entity @s weapon.mainhand {function: set_components,components: {food: {nutrition: 0,saturation: 0,can_always_eat: true,eat_seconds: $(EatSeconds)}}}

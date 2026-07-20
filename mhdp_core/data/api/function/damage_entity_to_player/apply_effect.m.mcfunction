#> api:damage_entity_to_player/apply_effect.m
#
# モンスターからプレイヤーに対してのダメージ処理 エフェクト付与
#
# @within function mhdp_core:player/damage/entity_to_player/apply

# データ設定
    $data modify storage api: Arg.Override.Level set value $(Level)
    $data modify storage api: Arg.Override.Tick set value $(Tick)

# エフェクト付与
    $function api:effect/apply.m {EffectId:$(EffectId)}

#> mhdp_items:weapons/short_sword/init
#
# 片手剣の初期化処理
#
# @within function mhdp_items:/**

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData.Shortsword set value {}

# 地の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.Shortsword.Normal.DirectAttack set value {AttackType:"Cut",DamageMult:40,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,4f,3f]}

# 天の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.Shortsword.Tec.DirectAttack set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,4f,3f]}

say -- 片手剣データ初期化
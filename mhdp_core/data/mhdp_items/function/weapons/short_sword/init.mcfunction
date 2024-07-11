#> mhdp_items:weapons/short_sword/init
#
# 片手剣の初期化処理
#
# @within function mhdp_items:/**

# 初期化
    data modify storage mhdp_core:game_data WeaponAttackData.ShortSword set value {}

# 地の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Normal.DirectAttack set value {AttackType:"Cut",DamageMult:10,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,3f,3f]}

# 天の型
    # 直接攻撃
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.DirectAttack set value {AttackType:"Cut",DamageMult:10,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.02,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
    # 通常コンボ
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Normal.1 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[3f,3f,3f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Normal.2 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:1.7,IsVfxStrong:false,VfxScale:[3f,4f,3f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Normal.3.1 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:5,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Normal.3.2 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.2,IsVfxStrong:false,VfxScale:[4f,4f,4f]}
    # 水平斬りコンボ
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Horizon.1 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.9,IsVfxStrong:false,VfxScale:[3f,4f,3f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Horizon.2 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:2.8,IsVfxStrong:false,VfxScale:[4f,4f,4f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Horizon.3 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:1.93,IsVfxStrong:false,VfxScale:[4f,5f,4f]}
    # 盾攻撃コンボ
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Bash.1 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:4,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Bash.2 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:4,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:false,VfxScale:[4f,4f,4f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Bash.3 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:4,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:-0.1,IsVfxStrong:true,VfxScale:[5.5f,5.5f,5.5f]}
    # 回転斬り
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Spin set value {AttackType:"Cut",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:1.6,IsVfxStrong:false,VfxScale:[4f,6f,4f]}
    # 旋刈り
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Tsumuji set value {AttackType:"Cut",DamageMult:60,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:1.6,IsVfxStrong:true,VfxScale:[5f,6f,5f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Tsumuji.Pursuit set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:1.6,IsVfxStrong:false,VfxScale:[0f,0f,0f]}
    # ジャストラッシュ
        # 1
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.1 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:false,VfxScale:[5f,6f,5f]}
        # 2
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.1 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.2 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.9,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.3 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.1.S set value {AttackType:"Blow",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:true,VfxScale:[7f,7f,7f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.2.S set value {AttackType:"Cut",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:-0.9,IsVfxStrong:true,VfxScale:[6f,8f,6f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.2.3.S set value {AttackType:"Cut",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:true,VfxScale:[6f,8f,6f]}
        # 3
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.3 set value {AttackType:"Blow",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.3.S set value {AttackType:"Blow",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0.9,IsVfxStrong:true,VfxScale:[7f,7f,7f]}
        # 4
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.4 set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.6,IsVfxStrong:false,VfxScale:[5f,5f,5f]}
            data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Just.4.S set value {AttackType:"Cut",DamageMult:50,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:0.6,IsVfxStrong:true,VfxScale:[6f,8f,6f]}
    # 駆け上がり斬り
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.JumpSlash set value {AttackType:"Cut",DamageMult:30,PartDamageMult:100,ElementDamageMult:120,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:true,IsShowVfx:true,VfxRotation:2.8,IsVfxStrong:false,VfxScale:[5f,8f,5f]}
    # フォールバッシュ
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Fall.High.1 set value {AttackType:"Blow",DamageMult:40,PartDamageMult:100,ElementDamageMult:0,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:true,VfxScale:[6f,6f,6f]}
        data modify storage mhdp_core:game_data WeaponAttackData.ShortSword.Tec.Fall.High.2 set value {AttackType:"Blow",DamageMult:40,PartDamageMult:100,ElementDamageMult:0,StunValue:0,TireValue:10,DragonAuraValue:0,IsDecreseSharpness:false,IsShowVfx:true,VfxRotation:0,IsVfxStrong:false,VfxScale:[0f,0f,0f]}

say -- 片手剣データ初期化
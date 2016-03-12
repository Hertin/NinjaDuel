
function Water_Shuriken_OnSpellStart(keys)
        local caster = keys.caster
        local point = keys.target_points[1]
        local startpoint = caster:GetOrigin()
        local endpoint = point
        local vector = endpoint-startpoint
        local teams = DOTA_UNIT_TARGET_TEAM_ENEMY
        local types = DOTA_UNIT_TARGET_BASIC+DOTA_UNIT_TARGET_HERO
        local flags = DOTA_UNIT_TARGET_FLAG_NONE
        --A Liner Projectile must have a table with projectile info
        local info = 
        {
                --Ability = caster:GetAbility(),
                EffectName = "particles/morphling_base_attack.vpcf",
                vSpawnOrigin = caster:GetAbsOrigin(),
                fDistance = 1000,
                fStartRadius = 125,
                fEndRadius = 125,
                Source = caster,
                bHasFrontalCone = false,
                bReplaceExisting = false,
                iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
                iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
                iUnitTargetType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO,
                fExpireTime = GameRules:GetGameTime() + 20.0,
                bDeleteOnHit = 0,
                vVelocity = vector:Normalized() * 1200,
                bProvidesVision = true,
                iVisionRadius = 300,
                iVisionTeamNumber = caster:GetTeamNumber()
        }
        projectile = ProjectileManager:CreateLinearProjectile(info)
        projectile.distination = point
end

function Water_Shuriken_OnProjectileHit(keys)
        local hTarget=keys.target
        local point=hTarget:GetOrigin()
        print (hTarget)
        local damage={
                victim=hTarget,
                attacker=keys.caster,
                damage=100,
                damage_type=DAMAGE_TYPE_MAGICAL,
        }
        print ("get hit success")

        --enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "", {})
        local nFXIndex = ParticleManager:CreateParticle("particles/morphling_adaptive_strike_ethereal2.vpcf", PATTACH_WORLDORIGIN ,nil)
        ParticleManager:SetParticleControl(nFXIndex, 1, point)
        ParticleManager:SetParticleControl(nFXIndex, 2, point)
        ParticleManager:SetParticleControl(nFXIndex, 3, point)
        ParticleManager:SetParticleControl(nFXIndex, 4, point)
        ParticleManager:SetParticleControl(nFXIndex, 5, point)
        ParticleManager:SetParticleControl(nFXIndex, 6, point)
        ParticleManager:SetParticleControl(nFXIndex, 7, point)
        ParticleManager:SetParticleControl(nFXIndex, 8, point)
        ParticleManager:SetParticleControl(nFXIndex, 9, point)
        ParticleManager:SetParticleControl(nFXIndex, 10, point)
        --ParticleManager:SetParticleControlEnt( nCasterFX, 1, nil, PATTACH_CUSTOMORIGIN_FOLLOW, nil, point, false )
        ParticleManager:ReleaseParticleIndex( nFXIndex )

        ApplyDamage(damage) 
end

-- function Water_Shuriken_OnProjectileFinish(keys)
--         point=this.point
--         FindUnitsInRadius()
--         local hTarget=keys.target
--         local point=hTarget:GetOrigin()
--         print (hTarget)
--         local damage={
--                 victim=hTarget,
--                 attacker=keys.caster,
--                 damage=100,
--                 damage_type=DAMAGE_TYPE_MAGICAL,
--         }
--         print ("get hit success")

--         --enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "", {})
--         local nFXIndex = ParticleManager:CreateParticle("particles/morphling_adaptive_strike_ethereal2.vpcf", PATTACH_WORLDORIGIN ,nil)
--         ParticleManager:SetParticleControl(nFXIndex, 1, point)
--         ParticleManager:SetParticleControl(nFXIndex, 2, point)
--         ParticleManager:SetParticleControl(nFXIndex, 3, point)
--         ParticleManager:SetParticleControl(nFXIndex, 4, point)
--         ParticleManager:SetParticleControl(nFXIndex, 5, point)
--         ParticleManager:SetParticleControl(nFXIndex, 6, point)
--         ParticleManager:SetParticleControl(nFXIndex, 7, point)
--         ParticleManager:SetParticleControl(nFXIndex, 8, point)
--         ParticleManager:SetParticleControl(nFXIndex, 9, point)
--         ParticleManager:SetParticleControl(nFXIndex, 10, point)
--         --ParticleManager:SetParticleControlEnt( nCasterFX, 1, nil, PATTACH_CUSTOMORIGIN_FOLLOW, nil, point, false )
--         ParticleManager:ReleaseParticleIndex( nFXIndex )

--         ApplyDamage(damage) 




-- end




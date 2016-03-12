
function Fire_Shuriken_OnProjectileHit(keys)
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
        print(point)
        --enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "", {})
        local light_strike_array = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_light_strike_array.vpcf", PATTACH_WORLDORIGIN ,nil)
        ParticleManager:SetParticleControl(light_strike_array, 0, point)
        ParticleManager:SetParticleControl(light_strike_array, 1, point)
        ParticleManager:SetParticleControl(light_strike_array, 2, point)
        ParticleManager:SetParticleControl(light_strike_array, 3, point)
        local light_strike_array_ashes = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_light_strike_array_ashes.vpcf", PATTACH_WORLDORIGIN ,nil)
        ParticleManager:SetParticleControl(light_strike_array_ashes, 0, point)
        ParticleManager:SetParticleControl(light_strike_array_ashes, 1, point)
        ParticleManager:SetParticleControl(light_strike_array_ashes, 2, point)
        local light_strike_array_explosion = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_light_strike_array_explosion.vpcf", PATTACH_WORLDORIGIN ,nil)
        ParticleManager:SetParticleControl(light_strike_array_explosion, 0, point)
        ParticleManager:SetParticleControl(light_strike_array_explosion, 1, point)
        ParticleManager:SetParticleControl(light_strike_array_explosion, 2, point)        
        -- ParticleManager:SetParticleControl(nFXIndex, 4, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 5, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 6, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 7, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 8, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 9, point)
        -- ParticleManager:SetParticleControl(nFXIndex, 10, point)
        local light_strike_array_fire = ParticleManager:CreateParticle("particles/units/heroes/hero_lina/lina_spell_light_strike_array_fire_b.vpcf", PATTACH_WORLDORIGIN ,nil)
        ParticleManager:SetParticleControl(light_strike_array_fire, 0, point)
        ParticleManager:SetParticleControl(light_strike_array_fire, 1, point)
        ParticleManager:SetParticleControl(light_strike_array_fire, 2, point)

        ParticleManager:ReleaseParticleIndex( light_strike_array )
        ParticleManager:ReleaseParticleIndex( light_strike_array_explosion )
        ParticleManager:ReleaseParticleIndex( light_strike_array_ashes )
        ParticleManager:ReleaseParticleIndex( light_strike_array_fire )        

        ApplyDamage(damage) 
end

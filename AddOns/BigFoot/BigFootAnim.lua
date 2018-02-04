BIGFOOT_ANIM_INTERVAL = 0.1
BigFoot_AnimManager = {}
BigFootAnim_LastUpdated = 0
BigFoot_ActionList = {}
BigFoot_ActionList["SHOW"] = "BigFoot_AnimShow"
BigFoot_ActionList["HIDE"] = "BigFoot_AnimHide"
BigFoot_ActionList["SLIDE"] = "BigFoot_AnimSlide"
BigFoot_ActionList["SHOCK"] = "BigFoot_AnimShock"
BigFoot_ActionList["WAIT"] = "BigFoot_AnimWait"
BigFoot_ActionList["SEQUENCE"] = "BigFoot_AnimSequence"

function BigFoot_PlayAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status = "running"
    end
end

function BigFoot_StopAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status = "stopped"
        for __index, BigFootAnim_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) do
            BigFootAnim_2361bab8b48b1041ad740bb561b21aee.passFlag = nil
            BigFootAnim_2361bab8b48b1041ad740bb561b21aee.runningFlag = nil
        end
    end
end

function BigFoot_PauseAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status = "stopped"
    end
end

function BigFoot_ReplayAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status = "stopped"
        for __index, BigFootAnim_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) do
            BigFootAnim_2361bab8b48b1041ad740bb561b21aee.passFlag = nil
            BigFootAnim_2361bab8b48b1041ad740bb561b21aee.runningFlag = nil
        end
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status = "running"
    end
end

function BigFoot_SetAnimControl(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d, BigFootAnim_b2c23ab16b0644a1e9658bc5c6a4fea9, BigFootAnim_2361bab8b48b1041ad740bb561b21aee)
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]["control"][BigFootAnim_b2c23ab16b0644a1e9658bc5c6a4fea9] = BigFootAnim_2361bab8b48b1041ad740bb561b21aee end

function BigFoot_DeleteAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d] = nil
end

function BigFoot_CreateAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d, BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a)
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d] = {}
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]["frame"] = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]["status"] = "stopped"
    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]["control"] = {}
    return BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d
end

function BigFoot_AddAction(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d, BigFootAnim_c4eb8122d53c6d9ddf505c1480e8cce3, BigFootAnim_f417b525a1892f289d238283f35ac1ad, BigFootAnim_876ae3817655938dba8b508a2da65e97, BigFootAnim_0c668a7a635873c7dc937f959f8fd596, BigFootAnim_fc5d30bf50d482241be8c5de333fe428, BigFootAnim_0e2babf2e3097eec96cf9280d1412ab5, BigFootAnim_00ae4bc475ffbcf97f789256a2e707de, BigFootAnim_6599f8c6a1b53d0212dfbab04e14e329, BigFootAnim_18bd17b74c56bfd23801044c9c9e8d4e, BigFootAnim_a29776f66159eb25625ce8ff4969048f, BigFootAnim_fe4d4227ea1d91e3a69c7b2a27e8150f, BigFootAnim_ff9ac8c817fb600a8633bbac91acd135, BigFootAnim_d2a75f7d621ef7006d92cec86286568b, BigFootAnim_39d32e6b95d64ca57ea8874610c27a8c)
    if (not BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d]) then
        return
    end
    if (not BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) then
        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions = {}
    end
    local BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9 = {}
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.beginHandler = BigFootAnim_0c668a7a635873c7dc937f959f8fd596
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.endHandler = BigFootAnim_fc5d30bf50d482241be8c5de333fe428
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.actionID = BigFootAnim_c4eb8122d53c6d9ddf505c1480e8cce3
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.func = getglobal(BigFoot_ActionList[BigFootAnim_f417b525a1892f289d238283f35ac1ad])
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.duration = BigFootAnim_876ae3817655938dba8b508a2da65e97
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.elapsed = 0
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg1 = BigFootAnim_0e2babf2e3097eec96cf9280d1412ab5
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg2 = BigFootAnim_00ae4bc475ffbcf97f789256a2e707de
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg3 = BigFootAnim_6599f8c6a1b53d0212dfbab04e14e329
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg4 = BigFootAnim_18bd17b74c56bfd23801044c9c9e8d4e
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg5 = BigFootAnim_a29776f66159eb25625ce8ff4969048f
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg6 = BigFootAnim_fe4d4227ea1d91e3a69c7b2a27e8150f
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg7 = BigFootAnim_ff9ac8c817fb600a8633bbac91acd135
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg8 = BigFootAnim_d2a75f7d621ef7006d92cec86286568b
    BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9.arg9 = BigFootAnim_39d32e6b95d64ca57ea8874610c27a8c
    table.insert(BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions, BigFootAnim_2e00ffac12aadb3a1fd865993ec505b9)
end

function BigFoot_StepRunAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d, BigFootAnim_e9f09a2766c0ce483b69d1aeb0a7ee9c)
    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].status == "running") then
        local BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f = 1
        if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions) then
            while (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f]) do
                if (not BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].passFlag) then
                    if (not BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].runningFlag) then
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].runningFlag = 1
                        if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].beginHandler) then
                            BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].beginHandler(BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].actionID)
                        end
                    end
                    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].func(
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].frame,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg1,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg2,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg3,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg4,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg5,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg6,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg7,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg8,
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].arg9)
                    BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].elapsed = BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].elapsed + BigFootAnim_e9f09a2766c0ce483b69d1aeb0a7ee9c

                    if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].duration == 0 or BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].elapsed > BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].duration) then
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].passFlag = 1
                        BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].runningFlag = nil
                        if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].endHandler) then
                            BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].endHandler(BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].actions[BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f].actionID)
                        end
                    end
                    return
                else
                    BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f = BigFootAnim_e914904fab9d05d3f54d52bfc31a0f3f + 1
                end
            end
        end
        if (BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].control.recycle) then
            BigFoot_ReplayAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
            return
        end
        BigFoot_StopAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
        if (not BigFoot_AnimManager[BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d].control.keepAlive) then
            BigFoot_DeleteAnim(BigFootAnim_bf33df4d3598f65863aeb7e29bf0862d)
            return
        end
    end
end

function BigFoot_AnimSlide(BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a, BigFootAnim_9f652eff74f4ab85c92761b518a48a56, BigFootAnim_ce7eff166556c4f00b1655de0278b678, BigFootAnim_315616fc95d16a1f2d915b940f721562)
    if (BigFootAnim_9f652eff74f4ab85c92761b518a48a56 and BigFootAnim_ce7eff166556c4f00b1655de0278b678) then
        local BigFootAnim_92fc56267c7e14d288fbcf74f912203d = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft()
        local BigFootAnim_0694c14294eb642e50750f9964155ae0 = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetTop()
        BigFootAnim_92fc56267c7e14d288fbcf74f912203d = BigFootAnim_92fc56267c7e14d288fbcf74f912203d + BigFootAnim_9f652eff74f4ab85c92761b518a48a56
        BigFootAnim_0694c14294eb642e50750f9964155ae0 = BigFootAnim_0694c14294eb642e50750f9964155ae0 + BigFootAnim_ce7eff166556c4f00b1655de0278b678
        BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", BigFootAnim_92fc56267c7e14d288fbcf74f912203d, BigFootAnim_0694c14294eb642e50750f9964155ae0)
    end
    if (BigFootAnim_315616fc95d16a1f2d915b940f721562) then
        local BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetAlpha()
        BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f = BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f + BigFootAnim_315616fc95d16a1f2d915b940f721562
        if (BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f > 1) then
            BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f = 1
        end
        if (BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f < 0) then
            BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f = 0
        end
        BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetAlpha(BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f)
    end
end

function BigFoot_AnimShock(BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a, BigFootAnim_a1a789d578fc6369895c0be7d86d6ba2, BigFootAnim_0996dbfd2919bdc3d83f73299ac8111f)
    local BigFootAnim_92fc56267c7e14d288fbcf74f912203d = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft()
    local BigFootAnim_0694c14294eb642e50750f9964155ae0 = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:GetTop()
    BigFootAnim_92fc56267c7e14d288fbcf74f912203d = BigFootAnim_92fc56267c7e14d288fbcf74f912203d + math.random(-BigFootAnim_a1a789d578fc6369895c0be7d86d6ba2, BigFootAnim_a1a789d578fc6369895c0be7d86d6ba2)
    BigFootAnim_0694c14294eb642e50750f9964155ae0 = BigFootAnim_0694c14294eb642e50750f9964155ae0 + math.random(-BigFootAnim_0996dbfd2919bdc3d83f73299ac8111f, BigFootAnim_0996dbfd2919bdc3d83f73299ac8111f)
    BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", BigFootAnim_92fc56267c7e14d288fbcf74f912203d, BigFootAnim_0694c14294eb642e50750f9964155ae0)
end

function BigFoot_AnimShow(BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a, BigFootAnim_58be92ecedd8702806a7ba2af475d890, BigFootAnim_29bb5db232a69a0ef4ed0090c9a61caf, BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f, BigFootAnim_b3648505cb2d578e4a1080bd97f2c756)
    local BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0
    if (BigFootAnim_b3648505cb2d578e4a1080bd97f2c756) then
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0 = BigFootAnim_b3648505cb2d578e4a1080bd97f2c756
    else
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0 = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a
    end
    if (BigFootAnim_58be92ecedd8702806a7ba2af475d890 and BigFootAnim_29bb5db232a69a0ef4ed0090c9a61caf) then
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0:SetPoint("TOPLEFT", "UIParent", "BOTTOMRIGHT", BigFootAnim_58be92ecedd8702806a7ba2af475d890, BigFootAnim_29bb5db232a69a0ef4ed0090c9a61caf)
    end
    if (BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f) then
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0:SetAlpha(BigFootAnim_bf61cd56adaeb71abb1cdca2566cb62f)
    end
    BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0:Show()
end

function BigFoot_AnimHide(BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a, BigFootAnim_b3648505cb2d578e4a1080bd97f2c756)
    local BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0
    if (BigFootAnim_b3648505cb2d578e4a1080bd97f2c756) then
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0 = BigFootAnim_b3648505cb2d578e4a1080bd97f2c756
    else
        BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0 = BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a
    end
    BigFootAnim_45e20bc7f954e889cd7d4f21e31079a0:Hide()
end

function BigFoot_AnimWait(BigFootAnim_411b8aa6d5954c6020f0b9c9e80e847a)
end

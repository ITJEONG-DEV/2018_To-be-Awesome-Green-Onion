local maxStat = 999
local maxMoney = 999999
local money = 100
local stress = 0
local hp = 0
local attack = 0
local int = 0
local charm = 0

local status = {}

function status.getMoney()
    return money
end

function status.setMoney(a)
    if 0 <= a and a <= maxMoney then
        money = a
        return true
    end

    return false
end

function status.getStress()
    return stress
end

function status.setStress(a)
    if 0 <= a and a <= maxStat then
        stress = a
        return true
    end

    return false
end

function status.getHp()
    return hp
end

function status.setHp(a)
    if 0 <= a and a <= maxStat then
        hp = a
        return true
    end

    return false
end

function status.getAttack()
    return attack
end

function status.setAttack(a)
    if 0 <= a and a <= maxStat then
        attack = a
        return true
    end

    return false
end

function status.getInt()
    return int
end

function status.setInt(a)
    if 0 <= a and a <= maxStat then
        int = a
        return true
    end

    return false
end

function status.getCharm()
    return charm
end

function status.setCharm(a)
    if 0 <= a and a <= maxStat then
        charm = a
        return true
    end

    return false
end

return status;

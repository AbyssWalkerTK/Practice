--Ugly Number
function GetUglyNumber(n)
    --构造性解法 真尼玛的快
    --Lua内置的表函数香死了
    local res=1
    local num=n
    if num == 1 then
        return 1
    else
        local q2,q3,q5={2},{3},{5}
        while num>1 do
            local x = math.min(q2[1],q3[1],q5[1])
            local pos = 0
            if x == q2[1] then
                local c = q2[1]
                table.remove(q2,1)
                table.insert(q2,2*c)
                table.insert(q3,3*c)
                table.insert(q5,5*c)
            elseif x == q3[1] then
                local c = q3[1]
                table.remove(q3,1)
                table.insert(q3,3*c)
                table.insert(q5,5*c)
            else
                local c = q5[1]
                table.remove(q5,1)
                table.insert(q5,5*c)
            end
            num=num-1
            res=x
        end
    end
    return res
end
function Get_K(x1,y1,x2,y2)--获取已知两点所在直线的K值
    local k = (x2-x1)/(y2-y1)
    return k
end

function Get_B(x1,y1,x2,y2)--获取已知两点所在直线的B值
    local k = Get_K(x1,y1,x2,y2)
    local b = y1-k*x1
    return b
end

function Get_Line(x1,y1,x2,y2)--获取已知两点所在直线的一般式的参数，顺序为A,B,C
    local k = Get_K(x1,y1,x2,y2)
    local b = Get_B(x1,y1,x2,y2)
    return {k,-1,b}
end

function Line_Inter(parA,parB)
    --传入两个表，分别为直线A一般式的参数与直线B一般式的参数
    if(parA[1] == parB[1]) then--配合Get_Line函数食用
        return "No Intersection"
    end
    local x = (parA[3]*parB[2]-parA[2]*parB[3])/(parA[2]*parB[1]-parA[1]*parB[2])
    local y = (parA[1]*parB[3]-parA[3]*parB[1])/(parA[2]*parB[1]-parA[1]*parB[2])
    return x,y  --返回交点横纵坐标
end

function TS_BoxCheck(x,y,par,kind)
    local rectangle = "rectangle"
    local circle = "circle"
    if kind ~= rectangle and kind ~= circle then return "Please Enter rectangle Or Circle" end
    if kind == rectangle then
        --矩形检测部分
        --传入待检测点的横纵坐标和包含四个顶点坐标的table，约定格式为par = {{x1,y1},{x2,y2},{x3,y3},{x4,y4}}
        local xmax,xmin= par[1][1],par[1][1]
        local ymax,ymin= par[1][2],par[1][2]

        for i = 2,4 do
            if par[i][1] > xmax then
                xmax = par[i][1]
            end
            if par[i][1] < xmin then
                xmin = par[i][1]
            end
            if par[i][2] > ymax then
                ymax = par[i][2]
            end
            if par[i][2] < ymin then
                ymin = par[i][2]
            end
        end

        if x >= xmin and x <= xmax and y >= ymin and y <= ymax then
            return true
        else
           return false
        end
    end
    if kind == circle then
        --传入点的坐标与包含点的坐标与半径的表，约定格式为par={x,y,r}
        if math.sqrt(x-par[1])*(x-par[1])+(y-par[2])*(y-par[2]) <= par[3] then
            return true
        else
            return false
        end
    end
end

function PointLineMin(x,y,par)--好像还没写对 回头检查
    --获得线与点之间最小距离的函数
    --输入为已知点的横纵坐标与包含直线方程的参数的表
    return math.abs(par[1]*x+par[2]*y+par[3])/math.sqrt(par[1]^2+par[2]^2)
end

function Line_Circle_Check(parL,parC)--获取线段与圆交点的函数，返回包含所有坐标的表,格式为{{x1,y1}...}
    --传入参数：包含线段的两个端点的表,约定parL={{x1,y1},{x2,y2}};包含圆的圆心与半径的表,约定parC={x,y,r}
    local line = Get_Line(parL[1][1],parL[1][2],parL[2][1],parL[2][2])
    
end

function CircleCircle(x1,y1,x2,y2,r1,r2)
    if math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))>(r1+r2) or math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))<(r1-r2) then
        return "No Intersection"
    end

end

function CircleCheck(x1,y1,x,y,r)
    if (x-x1)*(x-x1)+(y-y1)*(y-y1) <= r*r then--算出已知点与圆心的坐标的距离，然后与r比较
        return true
    else
        return false
    end
end

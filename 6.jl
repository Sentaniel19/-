using HorizonSideRobots
function draw!(robot)
    num_Nord1, num_Ost1 = to_corner(robot)
    draw_perimeter!(robot)
    num_West1, num_Sud1= draw_around!(robot)
    for _i in 1:num_Sud1
        move!(robot, Sud)
    end
    for _j in 1:num_West1
        move!(robot, West)
    end
    for _k in 1:num_Nord1
        move!(robot, Nord)
    end
    for _t in 1:num_Ost1
        move!(robot, Ost)
    end
end
function to_corner(robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, West) || !isborder(robot, Sud)
        if isborder(robot, Sud)
            move!(robot, West)
            num_West += 1
        else
            move!(robot, Sud)
            num_Sud += 1
        end
    end
    return num_Sud, num_West
end
function draw_perimeter!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end
function to_first_place!(robot)
    side = Ost
    num_Nord = 0
    num_Horizental_move = 0
    while !isborder(robot, side)
        move!(robot, side)
        num_Horizental_move += 1
        putmarker!(robot)
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            num_Nord += 1
            putmarker!(robot)
            side = inverse(side)
        end
        if isborder(robot, Nord)
            break
        end
    end
    current_side = side
    num_Ost = num_Horizental_move - (num_Nord) * 12 + num_Nord
    if current_side == West
        num_Ost = 12 - 1 - num_Ost        
    end
    return num_Ost, num_Nord, current_side
end

function draw_around!(robot)
    num_Ost, num_Nord, side = to_first_place!(robot)
    if side == Ost
        while !isborder(robot, side) && isborder(robot, next(side))
            move!(robot, side)
            putmarker!(robot)
            if !isborder(robot, side) && !isborder(robot, next(side))
                side = next(side)
                move!(robot, side)
                putmarker!(robot)
                if side == Ost
                    break
                end
            end
        end
    else
        while !isborder(robot, side) && isborder(robot, previous(side))
            move!(robot, side)
            putmarker!(robot)
            if !isborder(robot, side) && !isborder(robot, previous(side))
                side = previous(side)
                move!(robot, side)
                putmarker!(robot)
                if side == West
                    break
                end
            end
        end
    end
    return num_Ost, num_Nord
end
inverse(side::HorizonSide) = HorizonSide((Int(side) +2) % 4)
next(side::HorizonSide) = HorizonSide((Int(side) +1) % 4)
previous(side::HorizonSide) = HorizonSide((Int(side) + 3) % 4)
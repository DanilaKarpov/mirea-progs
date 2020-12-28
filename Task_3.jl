function mark_all(r::Robot)
    nun_vert = get_num_steps_movements!(r,Sud)
    nun_hor = get_num_steps_movements!(r,West)
    #Робот - в юго-западном углу

    side = Ost
    mark_row!(r,side)
    while isborder!(r,Nord)==false
        side=inverse(side)
        mark_row!(r,side)
    end
    #Робот - у северной границы, в одном из углов

    movements!(r,Sud)
    movements!(r,West)
    #Робот - в юго-западном углу

    movemens!(r,Ost,num_hor)
    movemens!(r,Nord,num_vert)

function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
    
function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
    end
end
    
function putmarkers!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r) 
        move!(r,side)
    end
    putmarker!(r)
    move!(r,Nord)
end
    
function putmarkers_last!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r) 
        move!(r,side)
    end
    putmarker!(r)
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))

Pos = 0
FinalPos = 16
FuelAmount = tonumber(arg[1])
FuelLimit = tonumber(arg[2])

if FuelAmount and FuelLimit
then
    local full = turtle.getFuelLevel() >= FuelLimit
    print "Program started..."

    while ( Pos < FinalPos and not full )
    do
        Pos = Pos+1
        turtle.select(Pos)
        local block = turtle.getItemDetail(Pos, true)
        if block ~= nil and block.name == "minecraft:coal"
        then
            repeat
                turtle.refuel(FuelAmount)
                print("Fueling up... Current fuel level is: "..tostring(turtle.getFuelLevel()))
                full = turtle.getFuelLevel() >= FuelLimit
            until full or turtle.getItemCount() == 0
        end
    end
    print("Fuel up program finished, current fuel level is: "..tostring(turtle.getFuelLevel()))
else
    print "Insert valid numbers for fuel amount to consume and fuel limit"
end

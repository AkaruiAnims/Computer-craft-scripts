-- Welcome to the code for BANK OS 2.2 by codecat technologies

--  note to self, add log-in option
-- If you're not a developer please exit this code (ctrl -> exit)

local printer = peripheral.wrap("printer_0")

function clearterm(option)
    term.clear()
    term.setCursorPos(1,1)
    if  option == "logo" then
        print("CodeCat.Tech Bank OS")
        print(" ")
    elseif option == "empty" then
        end
end

clearterm("logo")
print("Bankier: ")
local bankier = tostring(read())

function landDeed()
    clearterm("empty")

    print("What's the date: (Month/Day/year)")
    local date = tostring(read())
    
    print("Land owner's name: ")
    local name = tostring(read())
    
    print("Land location: (spawn land number/coords)")
    local location = tostring(read())
        
    printer.newPage()
    printer.setPageTitle(("Land deed for "..location))
    printer.write(("Date: "..date))
    printer.setCursorPos(1,3)
    printer.write(("The current holder of"))
    printer.setCursorPos(1,4)
    printer.write(("this deed("..name..")"))
    printer.setCursorPos(1,5)
    printer.write(("is the legal owner of"))
    printer.setCursorPos(1,6)
    printer.write(("land plot: "..location))
    printer.setCursorPos(1,7)
    printer.write(("and is here by allowed to"))
    printer.setCursorPos(1,8)
    printer.write(("make use of their land as"))
    printer.setCursorPos(1,9)
    printer.write(("they see fit."))
    printer.setCursorPos(1,20)
    printer.write(("Bankier: "..bankier))
    printer.endPage()
        
    print("Printing, Thank you")
    os.sleep(5)
end

function farmPatten()
    clearterm("empty")

    print("What's the date: (Month/Day/year)")
    local date = tostring(read())
    
    print("Farm owner's name: ")
    local name = tostring(read())
    
    print("Farm type: ")
    local farmtype = tostring(read())
        
    printer.newPage()
    printer.setPageTitle(("Patten for "..farmtype.." farm"))
    printer.write(("Date: "..date))
    printer.setCursorPos(1,3)
    printer.write(("The current holder of"))
    printer.setCursorPos(1,4)
    printer.write(("this deed("..name..")"))
    printer.setCursorPos(1,5)
    printer.write(("is the legaly allowed"))
    printer.setCursorPos(1,6)
    printer.write(("to farm: "..farmtype))
    printer.setCursorPos(1,7)
    printer.write(("and is here by the only"))
    printer.setCursorPos(1,8)
    printer.write(("person to make use"))
    printer.setCursorPos(1,9)
    printer.write(("of this kind of farm."))
    printer.setCursorPos(1,20)
    printer.write(("Bankier: "..bankier))
    printer.endPage()
        
    print("Printing, Thank you")
    os.sleep(5)
end
    
function businessPatten()
    clearterm("empty")

    print("What's the date: (Month/Day/year)")
    local date = tostring(read())
    
    print("Business owner's name: ")
    local name = tostring(read())
    
    print("Business name: ")
    local businessname = tostring(read())
        
    printer.newPage()
    printer.setPageTitle(("Patten for "..businessname))
    printer.write(("Date: "..date))
    printer.setCursorPos(1,3)
    printer.write(("The current holder of"))
    printer.setCursorPos(1,4)
    printer.write(("this patten("..name..")"))
    printer.setCursorPos(1,5)
    printer.write(("is the legal owner of"))
    printer.setCursorPos(1,6)
    printer.write((businessname.." and is"))
    printer.setCursorPos(1,7)
    printer.write(("responsible for all"))
    printer.setCursorPos(1,8)
    printer.write(("actions and transactions"))
    printer.setCursorPos(1,9)
    printer.write(("done by this business."))
    printer.setCursorPos(1,20)
    printer.write(("Bankier: "..bankier))
    printer.endPage()
        
    print("Printing, Thank you")
    os.sleep(5)
end

while true do
    clearterm("logo")
    print("state your business: ")
    print("(options:landdeed, farmpatten, businesspatten, shutdown)")
    local input = tostring(read())

  
    
    if input == "landdeed" then
        landDeed()
    elseif input == "farmpatten" then
        farmPatten()
    elseif input == "businesspatten" then
        businessPatten()
    elseif input == "shutdown" then
        os.shutdown()
    else 
        print("Invalid option")
        os.sleep(2)
    end
end
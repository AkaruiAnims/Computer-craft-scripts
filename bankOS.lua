-- Welcome to the code for BANK OS 2.2 by codecat technologies

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
    
function businessPatten()
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

clearterm("logo")
print("Bankier: ")
local bankier = tostring(read())

while true do
    clearterm("logo")
    print("state your business: ")
    print("(options:landdeed, farmpatten, businesspatten)")
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
        os.sleep(2)
        print("Invalid option")
    end
end
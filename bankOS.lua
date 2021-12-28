printer = peripheral.wrap("printer_0")
term.clear()
term.setCursorPos(1,1)
print("CodeCat.Tech Bank OS")
print(" ")
print("Bankier: ")
bankier = tostring(read())

while true do
    term.clear()
    term.setCursorPos(1,1)
    print("CodeCat.Tech Bank OS")
    print(" ")
    print("state your business: ")
    print("(options:landdeed, farmpatten, businesspatten)")
    input = tostring(read())

    function clearterm(option)
       term.clear()
       term.setCursorPos(1,1)
       if  option == "logo" then
           print("CodeCat.Tech Bank OS")
       elseif option == "empty" then
           end
    end

    function landDeed()
        clearterm("empty")
    
        print("What's the date: (Month/Day/year)")
        date = tostring(read())
    
        print("Land owner's name: ")
        name = tostring(read())
    
        print("Land location: (spawn land number/coords)")
        location = tostring(read())
        
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
    
    end
    
    function businessPatten()

    end
    
    if input == "landdeed" then
        landDeed()
    end
end
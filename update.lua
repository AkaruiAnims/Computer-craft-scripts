--  get all the pastebin things in here to update all the code bases
local bankOS = "hpkE2Avv"
local startup = "eess1s8h"
local update = "DbiwrWuL"
local turtleOS = "eYvv41iD"
local leaderBoard = "X6TtBbqw"
local label = getComputerLabel()

function dirLocation()
    if not(shell.dir() == "disk") then
        shell.setDir("disk")
    end 
end

shell.run("cd", "..")

shell.run("pastebin", "get", update, "update")
fs.delete("disk/update")
fs.move("update","disk/update")

if fs.exists("disk/bankOS") then
    fs.delete("disk/bankOS")
    fs.delete("disk/startup")

    dirLocation()

    shell.run("pastebin", "get", bankOS, "bankOS")
    shell.run("pastebin", "get", startup, "startup")

elseif fs.exists("turtleOS") then
    fs.delete("turtleOS")
    fs.delete("startup")
    
    shell.run("pastebin", "get", turtleOS, "turtleOS")
    shell.run("pastebin", "get", startup, "startup")
end


os.reboot()
-- make sure to redirect this to the according OS code
if fs.exists("disk/bankOS") then
    shell.run("disk/bankOS")

elseif fs.exists("turtleOS") then
    shell.run("turtleOS")
    
end
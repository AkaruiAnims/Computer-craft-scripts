if rednet.isOpen() == false then
    rednet.open("right")
end

while true do
    os.sleep(60)
    rednet.broadcast("updateLeaderBoard")
end
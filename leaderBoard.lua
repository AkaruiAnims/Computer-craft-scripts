-- leaderboard to show active players with connection to database to save records
--  check for chat/rednet event to put on board
-- get players via up time / every minute 
-- make alarm for 60 seconds
local board = peripheral.wrap("back")
local db = peripheral.wrap("right")
local chat = peripheral.wrap("top")
local detector = peripheral.wrap("bottom")
local hour = 0

if db.getDatabaseName() == nil and db.isDiskInserted() then 
    db.setDatabaseName("activityBoardDB")
end

function incrementScore(num) -- adds an extra minute to the online players to the database
    return (num + 1)
end

function detectPlayers() -- bruh
    return detector.getOnlinePlayers()
end

function clearBoard()
    board.clear()
    board.setCursorPos(1,1)
end

function addPlayer(player) -- makes the table if a player is not registered in the database and adds the player
    local largestID = db.executeSQL("SELECT MAX(ID) AS id FROM playerScore")
    local largestIDNum = incrementScore(largestID.data[1]["id"])
    db.executeSQL("INSERT INTO playerScore (ID,Players, Score) VALUES ("..largestIDNum..","..player..", 0)")
end

function getPlayers() -- gets the player data from the database
    return db.executeSQL("SELECT * from playerScore")
end

function getScore() -- gets the latest score in order
    return db.executeSQL("SELECT * from playerScore ORDER BY Score DESC")
end

function savePlayerScore(count, data) -- saves player data in database
    count = tonumber(count)
    for i = 1, count , 1 do
        db.executeSQL("UPDATE playerScore SET Score = "..data.data[i]["score"].." WHERE ID = "..data.data[i]["id"])
    end
end

function updateScore() --Update's the score board

    local dbPlayers= getPlayers()
    local dtctrPlayer = detectPlayers()
    local dbPlayersCount = 0
    local newdbPlayersCount = 0
    local dtctrPlayerCount = 0

    for index, value in ipairs(dbPlayers.data) do -- counts the lenght of the table
        dbPlayersCount = dbPlayersCount + 1
    end

    for index, value in ipairs(dtctrPlayer) do -- counts the lenght of the table
        dtctrPlayerCount = dtctrPlayerCount + 1
    end

    if dbPlayersCount < dtctrPlayerCount then -- adds a player if a new one logged on
        for i = 1, dtctrPlayerCount , 1 do
            local player = db.executeSQL("SELECT players FROM playerScore WHERE players = '"..dtctrPlayer[i].."'")
            if not(dtctrPlayer[i] == player.data[i]["players"]) then
                addPlayer(dtctrPlayer[i])
            end
        end
    end

    for i = 1, dbPlayersCount , 1 do -- increments score
        dbPlayers.data[i]["score"] = incrementScore(dbPlayers.data[i]["score"])
    end

    savePlayerScore(dbPlayersCount, dbPlayers) -- save the player scores

    local newdbPlayers = getScore() -- Latest Scores

    for index, value in ipairs(newdbPlayers.data) do -- counts the lenght of the table
        newdbPlayersCount = newdbPlayersCount + 1
    end

    clearBoard()
    board.setTextScale(1.5)
    board.setTextColor(colors.white)
    board.write("Top active players:")

    for i = 1, newdbPlayersCount, 1 do
        local x = i + 1
        board.setCursorPos(1,x)
        board.write(newdbPlayers.data[i]["players"]..": "..newdbPlayers.data[i]["score"].."Minutes")
    end

    if not(hour == 60) then
        hour = hour + 1
    else
        hour = 0
        chat.sendMessage("It's been a while, check your score! :)","ScoreBoard-Chan")
    end
end

function boardEvent(message) -- Waits for event then prints text to board
    board.setTextScale(2)
    board.setTextColor(colors.red)
    clearBoard()
    board.write(message)
end

while true do
    local event, sender, message, protocol = os.pullEvent("rednet_message")

    if event and not(message == "updateLeaderBoard" ) then
        boardEvent(message)
    elseif message == "updateLeaderBoard" then
        updateScore()
    end

end
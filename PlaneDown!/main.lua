
local planePlayerX = 400
local planePlayerY = 600
local enemyPlaneX = math.random(0 , 800)
local enemyPlaneY = 0;




function love.load()
    math.randomseed(os.time())
    planePlayer = love.graphics.newImage("plane.png")
    enemyPlane = love.graphics.newImage("enemyPlane.png")
    planePlayer:setFilter("linear", "nearest")
    enemyPlane:setFilter("linear", "nearest")
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setMode( 800, 800)
    main()
end

function main() 
function love.draw()
    love.graphics.draw(planePlayer, planePlayerX, planePlayerY, 0, 10)
    love.graphics.draw(enemyPlane, enemyPlaneX, enemyPlaneY, 0, 10)


  --love.graphics.print("First game!", 400, 400)
end

function love.update(dt)
    playerControls()
    enemyPlaneY = enemyPlaneY + 15
    love.timer.sleep(0.009)
    borderEnemy();
    collisionCheck();
end

function playerControls()
    if love.keyboard.isDown("d") then
        planePlayerX = planePlayerX + 4;
        print(planePlayerX)
    end

    if love.keyboard.isDown("a") then
        planePlayerX = planePlayerX - 4;
        print(planePlayerX)
    end

    if love.keyboard.isDown("w") then
        planePlayerY = planePlayerY -4;
        print(planePlayerX)
    end

    if love.keyboard.isDown("s") then
        planePlayerY = planePlayerY + 4;
        print(planePlayerX)
    end
end

function borderEnemy()
    if enemyPlaneY > 800 then
        enemyPlaneY = enemyPlaneY - 800
        enemyPlaneX = math.random(0 , 800)
    end
end
end

function mainMenu()
--    love.graphics.print("Welcome to PLANE DOWN!", 0, 0)
    if(love.keyboard.isDown("a")) then
        main()
    end 
end

i = 0
i2 = 25
function collisionCheck()
    if (enemyPlaneX == planePlayerX - i) then
        os.exit()
    else
        i = i + 1
    end

    if (enemyPlaneX == planePlayerX + i2) then
        os.exit()
    else
        i = i - 1
    end
end
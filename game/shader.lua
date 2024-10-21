local Shader = {}

local Memo = require 'game.memo'

local read = love.filesystem.read
local new = love.graphics.newShader
local set = love.graphics.setShader

local pattern = love.graphics.getRendererInfo() ~= 'OpenGL ES'
    and ('resource/shader/%s.glsl')
    or ('resource/shader/%s.essl')

local load = Memo(function (name)
    return new(pattern:format(name))
end)

Shader.set = function (name)
    local shader = load(name)
    set(shader)
    return shader
end

Shader.unset = function ()
    return set()
end

return Shader

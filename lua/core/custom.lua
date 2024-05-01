local NAME=...
local M = {}

local function find_project_root()
    local current_dir = vim.fn.expand('%:p:h')
    local root_dir = vim.fn.finddir('.git', current_dir .. ';')
    if root_dir ~= '' then
        return vim.fn.fnamemodify(root_dir, ':h')
    else
        return nil
    end
end

local function cmake_project()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! cd %s && cmake -S ./ -B ./build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug -G Ninja<CR>', project_root)
        os.execute(command)
        return command
    else
        return ""
    end
end

local function cmake_build()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! cd %s/build && ninja<CR>', project_root)
        os.execute(command)
        return command
    else
        return ""
    end
end

local function cmake_clean()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! cd %s && rm -rf build<CR>', project_root)
        os.execute(command)
        return command
    else
        return ""
    end
end

local function make_build()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! cd %s && compiledb make SPEEDYBEEF405V3<CR>', project_root)
        os.execute(command)
        return command
    else
        return '<cmd>:lua print("NO project root")<CR>'
    end
end

local function make_standard_build()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! tmux split-window -v -c "%s" "make clean; make; read"<CR>', project_root)
        os.execute(command)
        return command
    else
        return '<cmd>:lua print("NO project root")<CR>'
    end
end

M.cmake_cofigure = cmake_project
M.cmake_build = cmake_build
M.cmake_clean = cmake_clean
M.make_build = make_build
M.make_standard_build = make_standard_build

return M

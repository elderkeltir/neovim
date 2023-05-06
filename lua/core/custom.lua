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
        local command = string.format('<cmd>:! cd %s && cmake -S . -B build<CR>', project_root)
        --os.execute(command)
        return command
    else
        print("Project root not found.")
    end
end

local function cmake_build()
    local project_root = find_project_root()
    if project_root ~= nil then
        local command = string.format('<cmd>:! cd %s && cmake --build build<CR>', project_root)
        --os.execute(command)
        return command
    else
        print("Project root not found.")
    end
end

M.cmake_cofigure = cmake_project
M.cmake_build = cmake_build

return M

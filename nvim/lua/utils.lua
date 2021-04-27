require 'nvim_utils'

utils = {}

function utils.has(key)
    return vim.fn.has(key) == 1
end

function utils.get_env()
    local env = {}

    if (utils.has('win64') or utils.has('win32') or utils.has('win16')) then
        env.os = 'Windows'
    elseif utils.has('unix') then
        env.os = 'Linux'
    elseif utils.has('mac') then
        env.os = 'macOS'
    else
        env.os = 'other'
    end

    if utils.has('g:vscode') then
        env.head = 'VSCODE'
    elseif vim.fn.len(vim.fn.nvim_list_uis()) < 1 then
        env.head = 'HEADLESS'
    else
        env.head = 'NVIM'
    end

    vim.g.env = env
end

function utils.packadd(pkgs)
    for k, v in pairs(pkgs) do
        vim.cmd('packadd! ' .. v)
    end
end

function utils.t(str)
    return nvim.replace_termcodes(str, true, true, true)
end


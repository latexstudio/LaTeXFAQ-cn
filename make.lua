--[[

Copyright (C) 2018 by latexstudio <http://www.latexstudio.net>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

]]--

job_name   = "latex-faq-cn"
source_dir = "source"
aux_files  =
    {
        "aux",
        "fdb_latexmk",
        "fls",
        "lof",
        "log",
        "lot",
        "out",
        "synctex",
        "synctex.gz",
        "xdv"
    }

function get_path(...)
    local sep
    if os.type == "windows" then
        sep = "\\"
    else
        sep = "/"
    end
    local arg = {...}
    local argc = select("#", ...)
    local result = ""
    for i = 1, argc - 1 do
        result = result .. arg[i] .. sep
    end
    result = result .. arg[argc]
    return result
end

function rm(file)
    if os.type == "windows" then
        return os.execute("DEL /Q " .. file)
    else
        return os.execute("rm -f " .. file)
    end
end

function clean()
    for _, i in ipairs(aux_files) do
        rm(get_path(".", source_dir, "*." .. i))
    end
end

function help()
    local help_info =
        "\n" ..
        "  Lua build script for latex-faq-cn  Copyright (C) 2018 by latexstudio\n\n" ..
        "Usage:\n" ..
        "  -c, --clean    Delete auxiliary files\n" ..
        "  -h, --help     Print this help message then exit"
    return print(help_info)
end

if arg[1] == "-c" or arg[1] == "--clean" then
    return clean()
elseif arg[1] == "-h" or arg[1] == "--help" then
    return help()
else
    return help()
end

local finders = require('telescope.finders');
local sorters = require('telescope.sorters');
local pickers = require('telescope.pickers');
local actions = require('telescope.actions');
local action_set = require('telescope.actions.set');
local action_state = require('telescope.actions.state');

local tmux = {}

function tmux.manage_session(project_path, workspace, options)
  local project_name
  if project_path == "newProject" then
    project_name = vim.fn.input("Enter project name: ")
    if project_name and #project_name > 0 then
      project_path = vim.fn.fnamemodify(vim.fn.expand(workspace.path .. "/" .. project_name), ":p")
      os.execute("mkdir -p " .. project_path)
    end
  else
    project_name = project_path:match("./([^/]+)$");
  end

  local session_name = options.tmux_session_name_generator(project_name, workspace.name)

  if session_name == nil then
    session_name = string.upper(project_name)
  end
  session_name = session_name:gsub("[^%w_]", "_")

  local tmux_session_check = os.execute("tmux has-session -t=" .. session_name .. " 2> /dev/null")
  if tmux_session_check ~= 0 then
    os.execute("tmux new-session -ds " .. session_name .. " -c " .. project_path)
  end

  os.execute("tmux switch-client -t " .. session_name)
end

function tmux.attach(session_name)
  local tmux_session_check = os.execute("tmux has-session -t=" .. session_name .. " 2> /dev/null")
  if tmux_session_check == 0 then
    os.execute("tmux switch-client -t " .. session_name)
  end
end

function tmux.is_running()
  local tmux_running = os.execute("pgrep tmux > /dev/null")
  local in_tmux = vim.fn.exists('$TMUX') == 1
  if tmux_running == 0 and in_tmux then
    return true
  end
  return false
end

local M = {}

function M.tmux_sessions()
  if not tmux.is_running() then
    vim.api.nvim_err_writeln("Tmux is not running or not in a tmux session")
    return
  end

  local sessions = vim.fn.systemlist('tmux list-sessions -F "#{session_name}"')

  local entries = {}
  for _, session in ipairs(sessions) do
    table.insert(entries, {
      value = session,
      display = session,
      ordinal = session,
    })
  end

  pickers.new({
    results_title = "Tmux Sessions",
    prompt_title = "Select a Tmux session",
  }, {
    finder = finders.new_table {
      results = entries,
      entry_maker = function(entry)
        return {
          value = entry.value,
          display = entry.display,
          ordinal = entry.ordinal,
        }
      end,
    },
    sorter = sorters.get_fuzzy_file(),
    attach_mappings = function()
      action_set.select:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)
        tmux.attach(selection.value)
      end)
      return true
    end,
  }):find()
end

return M

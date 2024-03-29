return {
  'shredingu/harpoon',
  opts = {
    global_settings = {
      enter_on_sendcmd = true,
    },
    projects = {
      -- Yes $HOME works
      ['$HOME/.dotfiles'] = {
        term = {
          cmds = {
            "echo 'Hello from harpoon'",
            "echo 'Hello from harpoon 2nd command'",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require('Comment').setup(opts)
    require('telescope').load_extension 'harpoon'
    require 'harpoon.cmd-ui'
    require 'harpoon.tmux'
  end,
}

c = get_config()

c.TerminalIPythonApp.extensions = [
    'autoreload', 'Cython',
]
c.TerminalIPythonApp.exec_lines = [
    '%autoreload 2',
]
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'vim'
c.StoreMagics.autorestore = True

c.AliasManager.user_aliases = [
    ('ll', 'ls -lh'),
    ('la', 'ls -lah'),
]

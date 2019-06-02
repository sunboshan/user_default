# user_default

`user_default` is a module to add custom shell command. More doc can be found at `erl -man erl`'s `user_default and shell_default` section.

## Usage

1. add a file `~/.erlang`
    ```
    code:load_abs("/path/to/this/repo/ebin/user_default").
    ```
2. add your custom command in `src/user_default.erl`
3. `make build`
4. enter an erlang shell and you will have your custom shell command

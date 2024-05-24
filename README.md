# Local Mix Project

This project is set up to facilitate the iteration on local Elixir development scripts using Watchman and IEx.

## Purpose of Files

- **.watchmanconfig**: Configuration for Watchman to watch the `lib` directory and ignore unnecessary directories.
- **.zshrc.deviex**: Project-specific zsh configuration file that sets up auto-completion for scripts in the `scripts` folder.
- **iex_watch.sh**: Script to start Watchman and IEx, and stop Watchman when IEx exits.
- **watchman-make.sh**: Script executed by Watchman to compile the project when files in the `lib` directory change.
- **scripts**: Directory containing Elixir scripts to be run.
- **.gitignore**: Specifies files and directories to be ignored by Git.

## Development Setup Instructions

1. Add the following to your `~/.zshrc`:

   ```sh
   # Project-specific configuration for ~/dev/local_mix_project
   if [[ $PWD == ~/dev/local_mix_project* ]]; then
     source ~/dev/local_mix_project/.zshrc.deviex
   fi
   # open up iex in the local_mix_project directory
   alias iexdev='cd ~/dev/local_mix_project && mix iex.watch'
   ```

2. Reload your zsh configuration:

   ```sh
   source ~/.zshrc
   ```

## Running Scripts

1. Open a terminal.
2. Type `iexdev` to start IEx with Watchman auto-compilation.
3. Use `run_script list_diff_test.exs` to run a script from the `scripts` folder.

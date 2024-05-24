# Local Mix Project

This project is set up for iterating on local development scripts with Elixir. It includes configuration for automatic recompilation using Watchman and running IEx sessions with custom scripts.

## Setup Instructions

### Prerequisites

- Ensure you have Elixir and Watchman installed.

```sh
  asdf install elixir
  brew install watchman
```

## Development Setup Instructions

1. Add the following to your `~/.zshrc`:

   ```sh
   # Project-specific configuration for ~/dev/local_mix_project
    if [[ $PWD == ~/dev/local_mix_project* ]]; then
      source ~/dev/local_mix_project/.zshrc.deviex
    fi

    # open up iex in the local_mix_project directory
    alias iexdev='~/dev/local_mix_project/iex_watch_cleanup.sh'
   ```

2. Reload your zsh configuration:

```sh
source ~/.zshrc
```

## Running Scripts

1. Open a terminal.
2. Type `iexdev` to start IEx with Watchman auto-compilation.
3. Use `IExHelpers.run_script("list_diff_test.exs")` to run a script from the `scripts` folder.

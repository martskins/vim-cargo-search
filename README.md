# VIM-CARGO-SEARCH

Vim plugin to search crates using `cargo search`, list them in a floating buffer and easily add them to `Cargo.toml`.

## Install

If you are using vim-plug, you can install this plugin by adding:

`Plug 'martskins/vim-cargo-search'`

## Usage

`:CargoSearch crate-name`

Select the crate you want by pressing `<CR>`, this will yank the crate to your default register and open `Cargo.toml` for you.

Paste the crate in the correct section by pressing `<p>` as you would do normally.

[![Demo](https://res.cloudinary.com/dfjjhglsn/image/upload/v1576701777/Screencast2019-12-17233041_bi6etf.gif)](https://res.cloudinary.com/dfjjhglsn/image/upload/v1576701777/Screencast2019-12-17233041_bi6etf.gif)

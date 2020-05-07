# Fennel and TIC-80 game template
Boilerplate code for a simple [TIC-80](https://tic.computer/) game using [Fennel](https://fennel-lang.org/) lisp.

If you want to make your game from within TIC-80, it has a simple built-in
editor you can use that supports Fennel. However, if you would like to
use an external editor you are more comfortable with, this can help with that.

## Requirements
- GNU/Linux or OSX
- Install `tic80` and `fennel` packages from your package manager

## Usage

### Development

- `$ make compile` to compile all Fennel source files to Lua
- `$ make run` to run the compiled file with TIC-80

If you need to add more files, create them inside the `source`
directory and they will get included. Note that the files must be in
alphabetical order.

Note that splitting your game into multiple files means that the line
numbers in the error messages will not accurately map to the source files.

### Export to HTML
- Run your game with `$ make run`;
- Press `ESC` to open the prompt;
- Enter `export html` and save the zip file wherever you want, for example in `build/`;
- Quit the game and unzip the files.

### Test the game on the browser
If you want to test the game you have to serve the exported files. In this example we will use python, but you can chose whatever method you prefer.

- Run `make server` in the game directory.
- Visit <http://0.0.0.0:8000/> on your browser to test your game.


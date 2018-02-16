# Kibit-vim

[kibit](https://github.com/jonase/kibit) is a static code analyzer for Clojure, ClojureScript, cljx and other Clojure variants.

## Usage

vim-kibit allows you to analyze the current opened file by running:

`:KibitCheck`


## Installation

### Requirements

You'll want to have [kibit](https://github.com/jonase/kibit) and [vim-fireplace](https://github.com/tpope/vim-fireplace/) installed, and you'll need to make sure Kibit is somewhere on your project's classpath. I'd recommend adding the following to your `~/.lein/profiles.clj`:

```clojure
{:dependencies [[jonase/kibit "0.1.5" :exclusions [org.clojure/clojure]]]}
```

You'll also need to have a REPL connection open through fireplace.

After that, the rest should take care of itself.

### Installing with Pathogen

Assuming you already have [Pathogen](https://github.com/tpope/vim-pathogen) installed, you should be good to go with the following:

```
cd ~/.vim/bundle && \
git clone https://github.com/humorless/vim-kibit.git
```

## License

Copyright © 2018 Laurence Chen 

Distributed under the Eclipse Public License, the same as Clojure.

{
  plugins.mini-ai = {
    enable = true;
    lazyLoad.enable = true;
    lazyLoad.settings = {
      lazy = true;
      before = /*lua*/ ''function()
        require("lz.n").trigger_load("mini.extra")
        require("lz.n").trigger_load("which-key")
      end'';

      after = /*lua*/ ''function()
        local ai = require("mini.ai")
        local MiniExtra = require("mini.extra")
        ai.setup({
          n_lines = 500,
          mappings = {
            around = 'a',
            inside = 'i',
            around_next = 'an',
            around_last = 'al',
            inside_next = 'in',
            inside_last = 'il',
            goto_left = 'g[',
            goto_right = 'g]',
          },
          search_method = "cover_or_next",
          silent = false,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }),
            f = ai.gen_spec.treesitter({
              a = "@function.outer",
              i = "@function.inner",
            }),
            c = ai.gen_spec.treesitter({
              a = "@class.outer",
              i = "@class.inner",
            }),
            d = { "%f[%d]%d+" },
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
            e = { -- Word with case
              { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
              "^().*()$",
            },
            u = ai.gen_spec.function_call(), -- usage
            U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- usage without dot in name
            g = MiniExtra.gen_ai_spec.buffer(),
          },
        })

        require("which-key").add({
          mode = { "o", "x" },
          { "a ", group = "around", desc = "whitespace" },
          { "an ", group = "next", desc = "whitespace" },
          { "al ", group = "last", desc = "whitespace" },
          { "i ", group = "inside", desc = "whitespace" },
          { "in ", group = "next", desc = "whitespace" },
          { "il ", group = "last", desc = "whitespace" },

          { "a_", group = "around", desc = "underscore" },
          { "an_", group = "next", desc = "underscore" },
          { "al_", group = "last", desc = "underscore" },
          { "i_", group = "inside", desc = "underscore" },
          { "in_", group = "next", desc = "underscore" },
          { "il_", group = "last", desc = "underscore" },

          { 'a"', group = "around", desc = '" string' },
          { 'an"', group = "next", desc = '" string' },
          { 'al"', group = "last", desc = '" string' },
          { 'i"', group = "inside", desc = '" string' },
          { 'in"', group = "next", desc = '" string' },
          { 'il"', group = "last", desc = '" string' },

          { "a'", group = "around", desc = "' string" },
          { "an'", group = "next", desc = "' string" },
          { "al'", group = "last", desc = "' string" },
          { "i'", group = "inside", desc = "' string" },
          { "in'", group = "next", desc = "' string" },
          { "il'", group = "last", desc = "' string" },

          { "a`", group = "around", desc = "` string" },
          { "an`", group = "next", desc = "` string" },
          { "al`", group = "last", desc = "` string" },
          { "i`", group = "inside", desc = "` string" },
          { "in`", group = "next", desc = "` string" },
          { "il`", group = "last", desc = "` string" },

          { "a(", group = "around", desc = "() block" },
          { "an(", group = "next", desc = "() block" },
          { "al(", group = "last", desc = "() block" },
          { "i(", group = "inside", desc = "() block" },
          { "in(", group = "next", desc = "() block" },
          { "il(", group = "last", desc = "() block" },

          { "a)", group = "around", desc = "() block w/ whitespace" },
          { "an)", group = "next", desc = "() block w/ whitespace" },
          { "al)", group = "last", desc = "() block w/ whitespace" },
          { "i)", group = "inside", desc = "() block w/ whitespace" },
          { "in)", group = "next", desc = "() block w/ whitespace" },
          { "il)", group = "last", desc = "() block w/ whitespace" },

          { "a<", group = "around", desc = "<> block" },
          { "an<", group = "next", desc = "<> block" },
          { "al<", group = "last", desc = "<> block" },
          { "i<", group = "inside", desc = "<> block" },
          { "in<", group = "next", desc = "<> block" },
          { "il<", group = "last", desc = "<> block" },

          { "a>", group = "around", desc = "<> block w/ whitespace" },
          { "an>", group = "next", desc = "<> block w/ whitespace" },
          { "al>", group = "last", desc = "<> block w/ whitespace" },
          { "i>", group = "inside", desc = "<> block w/ whitespace" },
          { "in>", group = "next", desc = "<> block w/ whitespace" },
          { "il>", group = "last", desc = "<> block w/ whitespace" },

          { "a[", group = "around", desc = "[] block" },
          { "an[", group = "next", desc = "[] block" },
          { "al[", group = "last", desc = "[] block" },
          { "i[", group = "inside", desc = "[] block" },
          { "in[", group = "next", desc = "[] block" },
          { "il[", group = "last", desc = "[] block" },

          { "a]", group = "around", desc = "[] block w/ whitespace" },
          { "an]", group = "next", desc = "[] block w/ whitespace" },
          { "al]", group = "last", desc = "[] block w/ whitespace" },
          { "i]", group = "inside", desc = "[] block w/ whitespace" },
          { "in]", group = "next", desc = "[] block w/ whitespace" },
          { "il]", group = "last", desc = "[] block w/ whitespace" },

          { "a{", group = "around", desc = "{} block" },
          { "an{", group = "next", desc = "{} block" },
          { "al{", group = "last", desc = "{} block" },
          { "i{", group = "inside", desc = "{} block" },
          { "in{", group = "next", desc = "{} block" },
          { "il{", group = "last", desc = "{} block" },

          { "a}", group = "around", desc = "{} block w/ whitespace" },
          { "an}", group = "next", desc = "{} block w/ whitespace" },
          { "al}", group = "last", desc = "{} block w/ whitespace" },
          { "i}", group = "inside", desc = "{} block w/ whitespace" },
          { "in}", group = "next", desc = "{} block w/ whitespace" },
          { "il}", group = "last", desc = "{} block w/ whitespace" },

          { "a?", group = "around", desc = "user prompt" },
          { "an?", group = "next", desc = "user prompt" },
          { "al?", group = "last", desc = "user prompt" },
          { "i?", group = "inside", desc = "user prompt" },
          { "in?", group = "next", desc = "user prompt" },
          { "il?", group = "last", desc = "user prompt" },

          { "au", group = "around", desc = "use/call" },
          { "anu", group = "next", desc = "use/call" },
          { "alu", group = "last", desc = "use/call" },
          { "iu", group = "inside", desc = "use/call" },
          { "inu", group = "next", desc = "use/call" },
          { "ilu", group = "last", desc = "use/call" },

          { "aU", group = "around", desc = "use/call (no dot)" },
          { "anU", group = "next", desc = "use/call (no dot)" },
          { "alU", group = "last", desc = "use/call (no dot)" },
          { "iU", group = "inside", desc = "use/call (no dot)" },
          { "inU", group = "next", desc = "use/call (no dot)" },
          { "ilU", group = "last", desc = "use/call (no dot)" },

          { "aa", group = "around", desc = "argument" },
          { "ana", group = "next", desc = "argument" },
          { "ala", group = "last", desc = "argument" },
          { "ia", group = "inside", desc = "argument" },
          { "ina", group = "next", desc = "argument" },
          { "ila", group = "last", desc = "argument" },

          { "ab", group = "around", desc = ")]} block" },
          { "anb", group = "next", desc = ")]} block" },
          { "alb", group = "last", desc = ")]} block" },
          { "ib", group = "inside", desc = ")]} block" },
          { "inb", group = "next", desc = ")]} block" },
          { "ilb", group = "last", desc = ")]} block" },

          { "ac", group = "around", desc = "class" },
          { "anc", group = "next", desc = "class" },
          { "alc", group = "last", desc = "class" },
          { "ic", group = "inside", desc = "class" },
          { "inc", group = "next", desc = "class" },
          { "ilc", group = "last", desc = "class" },

          { "ad", group = "around", desc = "digit(s)" },
          { "and", group = "next", desc = "digit(s)" },
          { "ald", group = "last", desc = "digit(s)" },
          { "id", group = "inside", desc = "digit(s)" },
          { "ind", group = "next", desc = "digit(s)" },
          { "ild", group = "last", desc = "digit(s)" },

          { "ae", group = "around", desc = "CamelCase / snake_case" },
          { "ane", group = "next", desc = "CamelCase / snake_case" },
          { "ale", group = "last", desc = "CamelCase / snake_case" },
          { "ie", group = "inside", desc = "CamelCase / snake_case" },
          { "ine", group = "next", desc = "CamelCase / snake_case" },
          { "ile", group = "last", desc = "CamelCase / snake_case" },

          { "af", group = "around", desc = "function" },
          { "anf", group = "next", desc = "function" },
          { "alf", group = "last", desc = "function" },
          { "if", group = "inside", desc = "function" },
          { "inf", group = "next", desc = "function" },
          { "ilf", group = "last", desc = "function" },

          { "ag", group = "around", desc = "entire file" },
          { "ang", group = "next", desc = "entire file" },
          { "alg", group = "last", desc = "entire file" },
          { "ig", group = "inside", desc = "entire file" },
          { "ing", group = "next", desc = "entire file" },
          { "ilg", group = "last", desc = "entire file" },

          { "ai", group = "around", desc = "indent" },
          { "ani", group = "next", desc = "indent" },
          { "ali", group = "last", desc = "indent" },
          { "ii", group = "inside", desc = "indent" },
          { "ini", group = "next", desc = "indent" },
          { "ili", group = "last", desc = "indent" },

          { "ao", group = "around", desc = "block, conditional, loop" },
          { "ano", group = "next", desc = "block, conditional, loop" },
          { "alo", group = "last", desc = "block, conditional, loop" },
          { "io", group = "inside", desc = "block, conditional, loop" },
          { "ino", group = "next", desc = "block, conditional, loop" },
          { "ilo", group = "last", desc = "block, conditional, loop" },

          { "aq", group = "around", desc = "quote `\"'" },
          { "anq", group = "next", desc = "quote `\"'" },
          { "alq", group = "last", desc = "quote `\"'" },
          { "iq", group = "inside", desc = "quote `\"'" },
          { "inq", group = "next", desc = "quote `\"'" },
          { "ilq", group = "last", desc = "quote `\"'" },

          { "at", group = "around", desc = "tag" },
          { "ant", group = "next", desc = "tag" },
          { "alt", group = "last", desc = "tag" },
          { "it", group = "inside", desc = "tag" },
          { "int", group = "next", desc = "tag" },
          { "ilt", group = "last", desc = "tag" },
        }, { notify = false })
      end'';
    };
  };
}

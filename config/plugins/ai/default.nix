{ config, lib, pkgs, ... }:
let
  openaiApiKeyFile = config.neovim.ai.openai-api-key-file;
in
{
  extraPackages = [ pkgs.curl ];

  plugins.codecompanion = {
    enable = true;

    settings = {
      interactions = {
        chat.adapter = "openai";
        inline.adapter = "openai";
      };

      display.chat.window.layout = "vertical";

      adapters.http = lib.mkIf (openaiApiKeyFile != null) {
        openai.__raw = ''
          function()
            -- Preserve the built-in OpenAI adapter's request handling,
            -- overriding only how it obtains the API key.
            return require("codecompanion.adapters").extend("openai", {
              env = {
                api_key = function()
                  local path = ${builtins.toJSON openaiApiKeyFile}

                  local ok, lines = pcall(vim.fn.readfile, path)
                  if not ok then
                    error("Cannot read the OpenAI API key file: " .. path)
                  end

                  local key = vim.trim(table.concat(lines, "\n"))
                  if key == "" then
                    error("The OpenAI API key file is empty: " .. path)
                  end

                  return key
                end
              }
            })
          end
        '';
      };
    };

  };

  keymaps = [
    {
      key = "<leader>aa";
      mode = [ "n" "x" ];
      action = "<cmd>CodeCompanionActions<cr>";
      options = {
        desc = "AI Actions";
        silent = true;
      };
    }
    {
      key = "<leader>ac";
      mode = [ "n" ];
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      options = {
        desc = "Toggle AI Chat";
        silent = true;
      };
    }
    {
      key = "<leader>as";
      mode = [ "x" ];
      action = "<cmd>CodeCompanionChat Add<cr>";
      options = {
        desc = "Add Selection to Chat";
        silent = true;
      };
    }
    {
      key = "<leader>ai";
      mode = [ "n" "x" ];
      action = ":CodeCompanion ";
      options = {
        desc = "AI inline prompt";
      };
    }
  ];
}

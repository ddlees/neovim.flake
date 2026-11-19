{ lib, ... }:
{
  # Public options for editor configuration.

  options.neovim.ai.openai-api-key-file = lib.mkOption {
    description = ''
      Runtime path to a file containing the OpenAI API key.
      The file must be readable by the user running Neovim.

      When null, CodeCompanion will use the OPENAI_API_KEY
      environment variable.
    '';

    type = with lib.types; nullOr path;
    default = null;
  };
}

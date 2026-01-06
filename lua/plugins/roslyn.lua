return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- without this CPU usage stays at 50%+
      filewatching = "off",
      settings = {
        ["csharp|background_analysis"] = {
          -- openFiles instead of fullSolution - otherwise Roslyn analyzes ALL files
          -- in the solution in background, which kills performance on large projects.
          -- downside: errors in closed files not visible, but that's ok for neovim
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "openFiles",
        },
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = false,
          csharp_enable_inlay_hints_for_implicit_variable_types = false,
          csharp_enable_inlay_hints_for_lambda_parameter_types = false,
          csharp_enable_inlay_hints_for_types = false,
          dotnet_enable_inlay_hints_for_indexer_parameters = false,
          dotnet_enable_inlay_hints_for_literal_parameters = false,
          dotnet_enable_inlay_hints_for_object_creation_parameters = false,
          dotnet_enable_inlay_hints_for_other_parameters = false,
          dotnet_enable_inlay_hints_for_parameters = false,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = false,
          dotnet_enable_tests_code_lens = false,
        },
      },
    },
  },
}

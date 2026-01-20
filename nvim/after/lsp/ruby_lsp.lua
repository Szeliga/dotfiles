return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  init_options = {
    enabledFeatures = {
      codeActions = true,
      codeLens = true,
      completion = true,
      definition = true,
      diagnostics = true,
      documentHighlights = true,
      documentLink = true,
      documentSymbols = true,
      foldingRanges = true,
      formatting = true,
      hover = true,
      inlayHint = true,
      onTypeFormatting = true,
      selectionRanges = true,
      semanticHighlighting = true,
      signatureHelp = true,
      typeHierarchy = true,
      workspaceSymbol = true
    },
    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = true,
        implicitRescue = true
      }
    },
    indexing = {
      excludedPatterns = { "spec/**/*" },
      excludedGems = { "rubocop", "rubocop-ast", "rubocop-rake", "rubocop-rspec", "rubocop-rails", "bullet" },
      excludedMagicComments = { "compiled:true" }
    },
    experimentalFeaturesEnabled = true,
    linters = { "" },
    formatters = { "" },
  }
}

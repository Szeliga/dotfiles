return {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = { 'markdown', 'text', 'gitcommit' },
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/.config/nvim/harper/dictionary.txt",
      fileDictPath = "~/.config/nvim/harper/file_dictionaries",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000,
      ignoredLintsPath = "",
      excludePatterns = {},
    },
  },
}

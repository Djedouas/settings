return {
  "EdenEast/nightfox.nvim",
  opts = {
    groups = {
      all = {
        MatchParen = { bg = "#666666" },
        LspReferenceText = { style = "underline" }, -- for illuminate plugin
      },
    },
    options = {
      styles = {
        comments = "italic",
      },
      colorblind = {
        enable = true,
        severity = {
          protan = 0.8,
          deutan = 0.2,
          tritan = 0.0,
        },
      },
    },
  },
}

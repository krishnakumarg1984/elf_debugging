-- vim: foldmethod=marker:foldlevel=0:

-- Other project-specific 'diagnostic-linters' and 'formatters' to consider {{{
-- formatting.asmformat,
-- formatting.bibclean,
-- formatting.brittany,
-- formatting.format_r, -- needs the 'R' command to be in $PATH
-- formatting.fprettify,
-- formatting.goformat,
-- formatting.goimports,
-- formatting.latexindent,
-- formatting.mdformat,
-- formatting.perltidy,
-- formatting.reorder_python_imports,
-- formatting.rustfmt,
-- formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
-- formatting.sqlfluff,
-- formatting.standardrb,
-- formatting.styler, -- needs the 'R' command to be in $PATH
-- formatting.taplo,
-- diagnostics.actionlint,
-- diagnostics.ansiblelint,
-- diagnostics.chktex,
-- diagnostics.codespell,
-- diagnostics.cspell,  -- requires 'npm'
-- diagnostics.flake8,
-- diagnostics.gitlint,
-- diagnostics.hadolint,
-- diagnostics.jsonlint,
-- diagnostics.markdownlint,
-- diagnostics.mlint,
-- diagnostics.mypy,
-- diagnostics.proselint,
-- diagnostics.pydocstyle.with { extra_args = { "--config=$ROOT/setup.cfg" } },
-- diagnostics.pylama,
-- diagnostics.pylint,
-- diagnostics.pyproject_flake8,
-- diagnostics.revive.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.rstcheck,
-- diagnostics.selene,
-- diagnostics.semgrep,
-- diagnostics.shellcheck.with { diagnostics_format = "[#{c}] #{m} (#{s})" },
-- diagnostics.sqlfluff,
-- diagnostics.staticcheck.with { method = null_ls.methods.DIAGNOSTICS_ON_SAVE },
-- diagnostics.stylint,
-- diagnostics.textlint,
-- diagnostics.vale,
-- diagnostics.vint,
-- diagnostics.vulture, -- usually not available in path
-- diagnostics.write_good,
-- diagnostics.yamllint,
-- }}}

local status_ok_nvim_lint, nvim_lint = pcall(require, "lint")
if not status_ok_nvim_lint then
  return
end
nvim_lint.linters_by_ft = {
  cmake = { "cmakelint" },
  -- cpp = { "clangtidy", "flawfinder" },
  cpp = {},
  java = { "checkstyle" },
  latex = { "lacheck" },
  python = { "pycodestyle" },
  tex = { "lacheck" },
  rst = { "rstlint" },
}

-- vim.cmd [[autocmd BufWritePost * lua require('lint').try_lint()]]
vim.cmd [[
autocmd BufReadPost * lua require('lint').try_lint()
autocmd BufWritePost * lua require('lint').try_lint()
]]

local dap_status_ok, nvim_dap = pcall(require, "dap")
if dap_status_ok then
  require("dap.ext.vscode").load_launchjs(".vscode/launch.json", { lldb = { "c", "cpp" } })
  nvim_dap.adapters.lldb = nvim_dap.adapters.codelldb
end

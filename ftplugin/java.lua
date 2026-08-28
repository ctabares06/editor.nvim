local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

-- Find the Mason installation path for jdtls
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- Adjust the configuration directory based on your OS
local os_config = "linux"
if vim.loop.os_uname().sysname == "Darwin" then
  os_config = "mac"
elseif vim.loop.os_uname().sysname == "Windows_NT" then
  os_config = "win"
end

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", launcher_jar,
    "-configuration", jdtls_path .. "/config_" .. os_config,
    "-data", workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
}

-- Start or attach the language server
require('jdtls').start_or_attach(config)

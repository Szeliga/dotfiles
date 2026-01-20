return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab' },
  settings = {
    yaml = {
      schemaStore = { enable = true, url = "" },
      schemas = require('schemastore').yaml.schemas()
    }
  }
}

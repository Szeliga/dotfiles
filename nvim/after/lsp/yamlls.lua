return {
  settings = {
    yaml = {
      schemaStore = { enable = true, url = "" },
      schemas = require('schemastore').yaml.schemas()
    }
  }
}

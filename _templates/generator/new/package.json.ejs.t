---
to: _templates/<%= name %>/<%= action || 'new' %>/package.json.ejs.t
---
---
to: generated/package.json
---
<%%
  Name = h.changeCase.pascal(name)
  Names = h.inflection.pluralize(Name)
  dashCaseName = h.inflection.dasherize(h.inflection.underscore(Names))
%>
{
  "name": "@botfi/<%%= dashCaseName %>",
  "version": "0.0.1",
  "description": "TODO: Update description here",
  "keywords": [
    "botfi"
  ],
  "main": "dist/main.js",
  "author": "The Bot Fiction, Inc. <dev@botfi.io>",
  "license": "GPL-3.0-or-later",
  "scripts": {
    "prebuild": "yarn rimraf dist"
  },
  "dependencies": {
  }
}
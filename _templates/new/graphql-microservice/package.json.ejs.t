---
to: generated/package.json
---
<%
  Name = h.changeCase.pascal(name)
  Names = h.inflection.pluralize(Name)
  dashCaseName = h.inflection.dasherize(h.inflection.underscore(Names))
%>
{
  "name": "@botfi/<%= dashCaseName %>",
  "version": "0.0.1",
  "description": "TODO: Update description here",
  "keywords": [
    "botfi"
  ],
  "main": "dist/main.js",
  "author": "The Bot Fiction, Inc. <dev@botfi.io>",
  "license": "GPL-3.0-or-later",
  "scripts": {
    "prebuild": "yarn rimraf dist",
    "build": "yarn tsc -p tsconfig.build.json",
    "start": "yarn ts-node -r tsconfig-paths/register src/main.ts",
    "start:dev": "yarn tsc-watch -p tsconfig.build.json --onSuccess \"node dist/main.js\"",
    "start:debug": "yarn tsc-watch -p tsconfig.build.json --onSuccess \"node --inspect-brk=0.0.0.0:42220 dist/main.js\"",
    "start:prod": "node dist/main.js",
    "db:schema-dump": "prisma2 generate",
    "db:migrate": "prisma2 lift up",
    "db:migrate:dry-run": "prisma2 lift up --preview",
    "db:seed": "yarn ts-node prisma/seed.ts",
    "db:create": "yarn db:migrate && yarn db:schema-dump && yarn db:seed"
  },
  "dependencies": {
    "@apollo/federation": "0.10.2",
    "apollo-server": "2.9.7",
    "graphql": "14.5.8",
    "type-graphql": "0.17.5"
  }
}
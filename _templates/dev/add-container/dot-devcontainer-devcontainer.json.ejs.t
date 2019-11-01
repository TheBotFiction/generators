---
to: generated/.devcontainer/devcontainer.json
---
<%
  Name = h.inflection.singularize(h.changeCase.pascal(name))
  dashCaseName = h.inflection.dasherize(h.inflection.underscore(Name))
%>
{
  "name": "@botfi/<%= dashCaseName %>",
  "dockerComposeFile": "../docker-compose.yml",
  "service": "app",
  "workspaceFolder": "/workspace",
  "shutdownAction": "stopCompose",
  "extensions": [
    "esbenp.prettier-vscode",
    "joelday.docthis",
    "prisma.prisma",
    "prisma.vscode-graphql"
  ]
}
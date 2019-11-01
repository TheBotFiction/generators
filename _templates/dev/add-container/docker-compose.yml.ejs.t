---
to: generated/docker-compose.yml
---
<%
  Name = h.inflection.singularize(h.changeCase.pascal(name))
  dashCaseName = h.inflection.dasherize(h.inflection.underscore(Name))
%>
version: "3.7"

services:
  app:
    build:
      context: .
      dockerfile: .devcontainer/Dockerfile
    tty: true
    stdin_open: true
    working_dir: /workspace
    command: sleep infinity
    container_name: '<%= dashCaseName %>.botfi'
    environment:
      NAME: <%= dashCaseName %>.botfi
    volumes:
      - .devcontainer/.yarnrc:/root/.yarnrc:ro
      - yarn-cache:/yarn-cache
      - node_modules-cache:/node_modules
      - .:/workspace

networks:
  default:
    external: true
    name: botfi.local

volumes:
  node_modules-cache: {}
  yarn-cache: {}
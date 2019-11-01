# Templates
The generator for TheBotFiction

# Usage
- Prerequisite
```bash
$ yarn global add hygen
```
- Clone the code and execute generator
```bash
$ git clone git@github.com:TheBotFiction/templates.git
$ cd templates
$ hygen [name-of-generator] [name-of-action]
```
Ex:
```bash
$ hygen new graphql-microservice --name Sample --model MyModel --port 42999
```

# List of generator
- `dev`
  - `add-container`: Add docker / VSCode to the project  
    Ex:
    ```bash
    $ hygen dev add-container --name MyContainer
    ```
- `new`
  - `graphql-microservice`: Generate new GraphQL/Prisma2 microservice  
    Ex:
    ```bash
    $ hygen new graphql-microservice \
      --name MyService \
      --model MyModel \
      --port 42999
    ```
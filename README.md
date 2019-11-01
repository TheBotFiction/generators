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
$ hygen new graphql --name Sample --model MyModel --port 42999
```

# List of generator
- `dev`
  - `add-container`: Add docker / VSCode to the project  
    Ex:
    ```bash
    $ hygen dev add-container --name MyContainer
    ```
- `new`
  - `graphql`: Generate new GraphQL/Prisma2 microservice  
    Ex:
    ```bash
    $ hygen new graphql \
      --name MyService \
      --model MyModel \
      --port 42999
    ```

# Development
TL;DR: Use VSCode container
```bash
$ cd templates
$ code .
```
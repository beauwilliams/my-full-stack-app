#NOTE: Autogenerated template by @beauwilliams
# Declaratively set shell recipes a.k.a commands should run in
set shell := ["bash", "-uc"]

# Load environment variables
set dotenv-load := true
# apikey:
#    echo " from .env"

# set positional-arguments := true
# foo:
#   echo justinit
#   echo

# Colours

RED:= "\\033[31m"
GREEN:= "\\033[32m"
YELLOW:= "\\033[33m"
BLUE:= "\\033[34m"
MAGNETA:= "\\033[35m"
CYAN:= "\\033[36m"
WHITE:= "\\033[37m"
BOLD:= "\\033[1m"
UNDERLINE:= "\\033[4m"
INVERTED_COLOURS:= "\\033[7m"
RESET := "\\033[0m"
NEWLINE := "\n"

# Recipes

default:
    @#This recipe will be the default if you run just without an argument, e.g list out available commands
    @just --list --unsorted --list-heading $'{{BOLD}}{{GREEN}}Available recipes:{{NEWLINE}}{{RESET}}'
hello:
    @#Hide the recipe being run in the output using an @ symbol
    @#Here we use our hidden helper to prettify the text
    @just _bold_squares "{{YELLOW}}Hello World!"
display:
    #By default it prints the recipe that was run in output before outputting result
    echo -e "Hello World! {{UNDERLINE}}Here we see the recipe that was run printed also by omitting @ in front of recipe"
whoami $name:
    @#Recipe param as env variable with $ sign
    echo $name
init:
    @echo Initialising newly cloned repository..
    @npm install
install-legacy *PACKAGES:
    @#Recipe param as list of packages
    @echo NOTE: Using legacy peer dependencies flag due to dep conflict with ts-jest and babel
    npm install --legacy-peer-deps {{PACKAGES}}
install *PACKAGES:
    @#Recipe param as list of packages
    npm install {{PACKAGES}}
install-save-dev *PACKAGES:
    @#Recipe param as list of packages
    @echo NOTE: Using legacy peer dependencies flag due to dep conflict with ts-jest and babel
    npm install --legacy-peer-deps --save-dev {{PACKAGES}}
start:
    @npm run start:dev
start-backend:
    @npm run dev:my-backend
start-frontend:
    @npm run dev:ny-frontend
database-up:
    @npm run db:up
database-browser:
    @npm run db:studio
database-generate:
    @echo Running prisma generate to gen db types from db schema for use with graphQL
    @npm run db:create-client
generate-graphql:
    @npm run gen:gql
graph:
    @npx nx graph
graph-affected:
    @npx nx affected:graph
lint $scope:
    @npm run lint $scope
lint-all:
    @npx nx run-many --target=lint --all
test $scope:
    @npm run test $scope
test-all:
    @npx nx run-many --target=test --all
format $scope:
    @npm run format $scope
format-all:
    @npx nx format:write --all
build:
    @echo Running cached build on only affected/changed files
    @npx nx affected --target=build --all --parallel
build-full:
    @npm run build
update-nx-workspace:
    @echo Updating tools and frameworks to latest versions and depedenencies
    @npx nx migrate @nrwl/workspace@latest
bundle-size-frontend:
    @npx nx run my-frontend:export
create-page-my-frontend *PAGE_NAME:
    @echo NOTE: Use --dry-run flag to see what will be created
    @npx nx g @nrwl/next:page --project=my-frontend --style=css --name={{PAGE_NAME}}




# Hidden Recipes

_bold_squares message:
    @#Hidden recipes have _ in front, i.e these can be helpers such as pretty printer below
    @echo -e "{{BOLD}}[{{RESET}}{{message}}{{RESET}}{{BOLD}}]{{RESET}}"

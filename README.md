# Stories
[Frontend](https://github.com/johnryanmal/stories#stories) / Backend

Stories is an app that lets users create interactive stories, represented as a directed graph. Made using [react-digraph](https://github.com/uber/react-digraph).

View it in action [here](https://johnryanmal.github.io/stories/)!

## Installation
1. Clone the repository
```shell
git clone https://github.com/johnryanmal/stories-api
```

2. Enter the repository (Backend)
```shell
cd stories-api/
```

3. [Backend] Install dependencies
```shell
bundle install
```

4. [Backend] Create the database
```shell
rake db:create db:migrate
```

## Usage

1. Start the servers

[Backend] Start rails
```shell
rails server
```

[Frontend] Start vite
```shell
npm run dev
```

2. Go to http://localhost:5173 (or wherever Vite is hosting if you have a different config)

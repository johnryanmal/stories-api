# Stories
[Frontend](https://github.com/johnryanmal/stories#stories) / Backend

Stories is an app that lets users create interactive stories, represented as a directed graph. Made using [react-digraph](https://github.com/uber/react-digraph).

## Installation
1. Clone the repository
```
git clone https://github.com/johnryanmal/stories-api
```

2. Enter the repository (Backend)
```
cd stories-api/
```

3. [Backend] Install dependencies
```
bundle install
```

4. [Backend] Create the database
```
rake db:create db:migrate
```

## Usage

1. Start the servers

[Backend] Start rails
```
rails server
```

[Frontend] Start vite
```
npm run dev
```

2. Go to http://localhost:5173 (or wherever Vite is hosting if you have a different config)

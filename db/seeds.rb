User.create!([
  {name: "Test name", email: "test@test.com", password_digest: "$2a$12$rpiSVj4Zrmz/eo347yjaXurIxqfH.iYjlsdoPVBd7saReYgJ2VDEm"}
])
Story.create!([
  {title: "My story", graph: {"start"=>"It all begins here..."}, user_id: 1, public: true},
  {title: "My story", graph: {"nodes"=>[{"id"=>"1", "title"=>"???", "type"=>"text", "x"=>-200, "y"=>200}, {"id"=>"2", "title"=>"Advice", "type"=>"button", "x"=>0, "y"=>300}, {"id"=>"3", "title"=>"Help", "type"=>"button", "x"=>0, "y"=>100}, {"id"=>"4", "title"=>"To chat!", "type"=>"chat", "x"=>200, "y"=>200}], "edges"=>[{"source"=>"1", "target"=>"2", "type"=>"empty"}, {"source"=>"2", "target"=>"4", "type"=>"empty"}, {"source"=>"1", "target"=>"3", "type"=>"empty"}, {"source"=>"3", "target"=>"4", "type"=>"empty"}]}, user_id: 1, public: false}
])

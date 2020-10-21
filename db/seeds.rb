user1 = User.create(:username => "skittles123", :password => "iluvskittles")

user2 = User.create(:username => "flatiron4lyfe", :password => "Rubie!")

user3 = User.create(:username => "kittens1265", :password => "crazycatlady")

user4 = User.create(:username => "cat", :password => "123456")

set1 = DartSet.create(:name => "stuff", :user_id => 1)

set2 = DartSet.create(:name => "things", :user_id => 2)

set3 = DartSet.create(:name => "badass", :user_id => 3)

set4 = DartSet.create(:name => "wingit", :user_id => 4)

set5 = DartSet.create(:name => "kapoochin", :user_id => 1)

set6 = DartSet.create(:name => "lavender", :user_id => 2)

set7 = DartSet.create(:name => "stench", :user_id => 3)

set8 = DartSet.create(:name => "exciting", :user_id => 4)

dart1 = Dart.create(dart_set_id: 1, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart2 = Dart.create(dart_set_id: 2, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart3 = Dart.create(dart_set_id: 3, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart4 = Dart.create(dart_set_id: 4, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart5 = Dart.create(dart_set_id: 5, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")
 
dart6 = Dart.create(dart_set_id: 6, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart7 = Dart.create(dart_set_id: 7, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")

dart8 = Dart.create(dart_set_id: 8, :name => "exciting",  :manufacturer => "makas", :condition => "good", :body => "22g", :shaft => "Aluminum", :flight => "chipped")


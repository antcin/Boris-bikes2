# challenge2 #

### nouns
- person
- bike
- docking station

### verbs
- use bike
- release bike
- bike working?


| Objects        | Messages        |
| -------------- |:---------------:|
| person         | use_bike        |
| bike           | is_working?     |   
| docking_station| release_bike    |   


### diagram

```
bike <-- is_working? --> true/false
docking_station <-- release_bike --> bike
```

# challenge4 #
- error type = NameError
- error file path = ./.rvm/rubies/ruby-2.4.1/bin/irb:11
- error line number = 1
- **error solution = initialize new class/constant called DockingStation**

# challenge5 #
- initialize rspec using ```rspec --init```
- create new spec file inside spec folder named docking_station_spec.rb
- ```describe DockingStation do end ```
- error message is same because we didnt initialize the class. we only wrote the test.

# challenge6 #
- created a lib directory inside project repo
- within lib directory we created ```docking_station.rb``` where we initialize the class.
- we added ```require 'docking_station'``` at the top of docking_station_spec.rb
- we didnt get any error message because we initialized DockingStation class and we've told spec file where to find it.

# challenge7 #
- noticed that using ```require 'filename'``` does not take us to the path; therefore we had to use absolute path ```require './lib/docking_station.rb'```
- we don't see an error anymore because we now have initialised the class and we are able to create DockingStation objects.
- calling ```docking_station.release_bike``` gives an ```undefined method``` because we have not defined a ```release_bike``` method, yet

# challenge8 #
- Added test to expect ```DockingStation``` to respond to ```release_bike```
- Rewrote text using one-line syntax: ```it { is_expected.to respond_to(:release_bike)}```
- Error running ```rspec```: failing because method ```release_bike``` was not initialised (were expecting error message saying something like "undefined method")
- Defined ```release_bike``` method in ```DockingStation``` class
- After running ```rspec```, we didn't get an error anymore, because method is now defined.

# challenge9 #
- Saved ```docking_station.release_bike``` to ```bike``` ( ```bike``` is a ```nil``` object because the ```release_bike``` method was empty)
- Called ```working?``` method on ```bike```, got a ```NoMethodError``` because we had not defined a ```working?``` method, yet
- Created ```bike_spec.rb``` test file.
- Ran ```rspec``` and got ```NameError``` ```uninitialized constant Bike``` because we have not initialized a ```Bike``` class, yet
- Initialised ```Bike``` class in file ```bike.rb``` (saved in ```./lib```). And also added ```require 'bike'``` at the top of ```bike_spec.rb```
- Added a test to ```bike_spec.rb``` that expects instances of ```Bike``` to respond to ```working?``` method
- Ran ```rspec``` and got an error message because, we had not defined ```working?``` method in ```Bike``` class
- Defined ```working?```, ran ```rspec``` and test passed.

# challenge10 #
- We are getting an undefined method error because ```Bike``` and ```DockingStation``` are not "connected". Therefore we need to find a way to make them interact.
- Added a spec to ```docking_station_spec``` to release a bike. Running ```rspec``` will give an error, because test syntax ```be_working``` expects the program to return ```true```, whereas our method still returns ```nil```. ***To fix this***, we let ```working?``` method return ```true```.
- In ```DockingStation``` , in method ```release_bike``` we have instantiated a bike object (```Bike.new```); In order to do that we ```require 'bike'```. In this case, using ```require``` only would give us a ```LoadError``` because ```irb``` tries to search into Ruby's library path which doesn't contain any ```bike``` file.
  - We used ```require_relative 'bike'``` to load instances of ```Bike``` class into ```DockingStation```

# challenge11 #

| Objects        | Messages        |
| -------------- |:---------------:|
| person         | use_bike        |
| bike           | is_working?     |   
| docking_station| release_bike    |
| docking_station| dock       |
| docking_station           | bike         |

- Ran feature test for ```dock``` method to see if bike has been docked at ```DockingStation``` object. Test was failing because method was undefined.
- Wrote unit test to check that docking station was responding to method ```dock```. Test was failing, because method did not exist in ```DockingStation``` class.
- Defined ```dock``` method in ```DockingStation``` class. Ran successful unit test.
- We needed the ```DockingStation``` instance to have the ability to remember instances of ```Bike``` class
- Ran a test on dock_bike without an argument; test failed
- Assigned an argument to ```dock``` method; test passed
- When we called ```dock``` method on ```DockingStation``` in feature test; nil is returned
- Ran feature test to see if ```DockingStation``` instance responds to method called ```bike```. Test failed because no such method was defined.
- Created unit test for ```bike```, test failed in ```rspec```. To make the test pass, we defined a method ```bike``` in ```DockingStation```
- Created a unit test for ```bike``` method, returning a docked bike. Test failed because method was empty (returning ```nil``` instead of instance of ```Bike``` class). We created a ```@bike``` instance variable and assigned ```Bike``` object to it.
- Method ```bike``` now returns instance variable ```@bike```.
- To refactor our code we used ```attr_reader :bike``` syntax and deleted ```bike``` method from ```docking_station.rb``` and ```docking_station_spec.rb``` --> **referential transparency**

# challenge12 #
- Ran feature test in irb. Docking station instatiates a new bike every time ```release_bike``` method is called.
- Rewrote the test for ```release_bike``` method in ```docking_station_spec.rb```. It now raises an error when there are no bikes available.
- In ```bike.rb```, used ```raise``` to raise exception in ```release_bike``` method.
- Ran both feature and ```rspec``` test, both pass.
- We use curly braces syntax because matchers in ```rspec``` can only be matched against blocks because they have to observe the block while it's running in order to operate properly.

# challenge13 #
- Rewrote the test for ```dock``` method in ```docking_station_spec.rb```. It raises an error when dock is full.
- In ```bike.rb```, used ```raise``` to raise exception in ```dock``` method. Along with that, used a guard condition.
- Tests pass

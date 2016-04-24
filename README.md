# HTM Application

## Setup

#### Ruby environment setup

Install the ruby environment as well as the gem **Bundler**.

#### Next Run:
```
bundle install
```

#### Run the program with:
```
HTM.rb simulate 100
```

This will run the program with 100 cycles of random input.  Change the integer value to change the amount of cycles of input.

## Options

To change how the program functions, change the constant values inside the config.rb file located:

```
lib/app/config.rb
```

You can change most of the thresholds and values of the HTM program, like amount of columns and cells, as well as the speed at which relationships are formed.  Each value is documented in the config file.

## Simulate Command

This runs input on a single layer (layer 2/3) and only on a single region.  This only provides an example of how relationships are formed and how a region would handle input.  To add the functionality of a hierarchy, you would need to change the **fire** function in **column.rb** so that when an entire column fires, the pattern gets passed to the next region.  To add more cells, add a file to the **cells** folder and declare its implementation there.  It should run in **fire** function of **column.rb** which provides both the new input and the previous input.  

## Contributing
This project is welcome to pull requests and is open to collaborators.

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

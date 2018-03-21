# RTree

***under implementing***

On windows, there is no command that displaies directory structure in any hierarchy.
(There is tree command, but has no option about directory hierarchy)

If you use 'findstr' command with 'tree' command, you can generate that.
```Two layer example
>tree | findstr /R /C:"^├" /C:"^│  ├" /C:"^│  └" /C:"^└"  /C:"^    ├" /C:"^    └"
```

But it uses a lot of resources when directory structure is deep.
Because it search all of directories at first.
So, I wrote ruby program which can display directory structure in any hierarchy. 

## Usage
Module RTree includes methods tree(only for directory) and ftree(including files).
They returns array which contains strings to output.
If you want to output directory structure from the directory [path] and number of hierarchy [layer], write like these.
```ruby
require 'r_tree'

#Outputs directories
RTree.tree(path,layer).each{|s| puts s}

#Outputs including files
RTree.ftree(path,layer).each{|s| puts s}
```


## Sample program
sample.rb and sample_f.rb are sample program.
Execute it as below
```executing
>ruby sample.rb root_path number_of_hierarchy
```
sample.rb outputs only directories sample_f.rb includes files.
Without root_path option, it uses sample directory (./test_dir/)
Below is sample of output.
```Executing sample
r_tree> ruby ./sample_f.rb 3
test_dir
├─ 1
│  test1
├─ 2
│  test2
└─ 3
   ├─ 4
   │  test3
   └─ 5
      ├─ 6
      └─ 7
```

<!--
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'r_tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install r_tree


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/r_tree. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

-->
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


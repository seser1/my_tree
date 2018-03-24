# RTree

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
'get' method returns instance of rtree, it contains data of directory structure.
With 'to_s' method, you can gain array which contains strings that indicate directory structure.
If you want to output directory structure from the directory [path] and number of hierarchy [layer], write like these.
```ruby
require 'r_tree'

#Get instance
tree=RTree.get(path,layer)


#Output directories
tree.to_s.each{|s| puts s}

#Output directories and files
tree.to_s(:f).each{|s| puts s}


#Get json formatted directory structure
js=tree.to_json
#You can use JSON-methods for general object (e.g. pretty_generate)
pjs=JSON.pretty_gerate(tree)

```


## Sample program
sample.rb and sample_j are sample programs.
Execute it as below
```executing
>ruby sample.rb root_path number_of_hierarchy with_file?(-f)
>ruby sample_j.rb root_path number_of_hierarchy
```
Without root_path option, it uses sample directory (./test_dir/)
'number_of_hierarchy' is max layer of directory.
With -f option, it outputs not only directories but also files in them.
Below is sample of output.
```Executing sample
r_tree> ruby ./sample_f.rb 3 -f
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
      │  test4
      └─ 7
         test5

r_tree> ruby ./sample_j.rb 2
{"name":"test_dir","childs":[{"name":"1","childs":[],"files":["test1"]},{"name":"2","childs":[],"files":["test2"]},{"name":"3","childs":[{"name":"4","childs":[],"files":["test3"]},{"name":"5","childs":[],"files":[]}],"files":[]}],"files":[]}
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


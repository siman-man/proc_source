# proc_source

get the sourcecode for a Proc object

## Installation

install it yourself as:

    $ gem install proc_source

## Usage

```ruby
require "proc_source"

proc1 = Proc.new do |i|
  puts i
end

puts proc1.proc_source
```

```
        Proc.new do |i|
  puts i
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ProcSource project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/siman-man/proc_source/blob/master/CODE_OF_CONDUCT.md).

# Bootstrap::Modal::Rails

Rails Asset Gem for the default [Bootstrap Modal](https://github.com/jschr/bootstrap-modal) class by [Jordan Schroter](https://github.com/jschr)

## Installation

Add these lines to your application's `Gemfile`:

```ruby
group :assets do
 gem 'bootstrap-modal-rails'
end
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install bootstrap-modal-rails
```

## Usage

### Stylesheets

```sass
@import bootstrap-modal
```

### Javascripts
```coffeescript
#= require bootstrap-modal
#= require bootstrap-modalmanager
```

## Versioning

This gem will directly track the semantic versioning releases of the [https://github.com/jschr/bootstrap-modal](Bootstrap Modal) project.
If it should be necessary a build number will be added to the version to mark releases specific to this gem.

## Note on Patches / Pull Requests
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.


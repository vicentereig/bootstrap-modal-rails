# Bootstrap::Modal::Rails

Rails Asset Gem for the default [Bootstrap Modal](https://github.com/jschr/bootstrap-modal) class by [Jordan Schroter](https://github.com/jschr)

## Installation

Add these lines to your application's `Gemfile`:

```ruby

### Rails 3 or previous

group :assets do
 gem 'bootstrap-modal-rails'
end

### Rails 4

gem 'bootstrap-modal-rails'

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
//=require tree .
//=require bootstrap-modal
```
Or if you are using Rails 4

```sass
 *= require tree .
 *= require bootstrap-modal-bs3patch
 *= require bootstrap-modal
```

Note: It must appear after your require tree because otherwise bootstrap includes will overwrite much of the logic. This will result in margin-top and height issues where you will only see the bottom half of the modal because its too high up. 

The other alternative is to manually place the css file inside any arbitrary folder within app/assets/stylesheets/ (ex. anyFolder/bootstrap-modal.css). then you will not need to require bootstrap-modal, but require tree . will be necessary.

You can download the css file from here: 
https://raw.githubusercontent.com/vicentereig/bootstrap-modal-rails/master/vendor/assets/stylesheets/bootstrap-modal.css

### Javascripts

coffeescript
```coffeescript
#= require bootstrap-modal
#= require bootstrap-modalmanager
```

javascript
```javascript
//= require bootstrap-modal
//= require bootstrap-modalmanager
```

## Versioning

This gem will directly track the semantic versioning releases of the [Bootstrap Modal](https://github.com/jschr/bootstrap-modal) project.
If it should be necessary a build number will be added to the version to mark releases specific to this gem.

## Note on Patches / Pull Requests
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.


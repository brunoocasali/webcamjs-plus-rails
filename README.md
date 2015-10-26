# Webcam.js + Rails

**To get working with Rails and Webcam use:**

### 1°:

- Generate a new rails app. `$ rails g new YOUR-APP-NAME`
- Enter in this directory. `$ cd YOUR-APP-NAME/`

### 2°:

- Open https://github.com/jhuckaby/webcamjs and download as zip (or clone).
- Copy the `webcam.min.js` and `webcam.swf` to `vendor/assets/javascripts`.

### 3°:

- Open `assets.rb` and add this line: `Rails.application.config.assets.precompile += %w( webcam.swf )`
- Open `app/assets/javascripts/application.js` and add: `//= require webcam.min` between the turbolinks and .
  like this:
  ```js
  //= require turbolinks 
  //= require webcam.min
  //= require_tree .
  ```

### 4°:

Add to your Gemfile this gem (I've removed all unused gems from this app): 
 
```rb
gem 'carrierwave' 
gem 'rmagick' # if you have any error to get this working see this link: http://stackoverflow.com/a/5207041
```

And them bundle:

`$ bundle install`

### 5°:

- Generate a new uploader: `$ rails g uploader ProductImage`
- Generate a simple scaffold: `$ rails g scaffold product name image`
- Open `config/routes.rb` and set the root url: `root 'products#index'`

### 6°:

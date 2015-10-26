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
 
`gem 'carrierwave'` 

And them bundle:

`$ bundle install`

### 5°:
- Generate a new uploader: `$ rails g uploader ProductImage`
- Generate a simple scaffold: `$ rails g scaffold product name image`

### 6°:

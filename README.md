# Webcam.js + Rails + Carrierwave

Webcam.js: https://github.com/jhuckaby/webcamjs  
Rails: https://github.com/rails/rails  
Carrierwave: https://github.com/carrierwaveuploader/carrierwave

**To get working with Rails and Webcam use:**

### 1°:

- Generate a new rails app. `$ rails g new YOUR-APP-NAME`
- Enter in this directory. `$ cd YOUR-APP-NAME/`

### 2°:

- Open https://github.com/jhuckaby/webcamjs and download as zip (or clone).
- Copy the `webcam.min.js` and `webcam.swf` to `vendor/assets/javascripts`.

### 3°:
- Open `assets.rb` and add this line: `Rails.application.config.assets.precompile += %w( webcam.swf )`
- Open `app/assets/javascripts/application.js` and add: `//= require webcam.min` between the turbolinks and . like this:

  ```js
  //= require turbolinks 
  //= require webcam.min
  //= require_tree .
  ```

### 4°:

Add to your Gemfile this gem (I've removed all unused gems from this app): 
 
```rb
gem 'carrierwave' 
gem 'carrierwave-base64' 
gem 'rmagick' # have any error? see this link: http://stackoverflow.com/a/5207041
```

And them bundle:

`$ bundle install`

### 5°:
- Generate a new uploader: `$ rails g uploader ProductImage`
- Generate a simple scaffold: `$ rails g scaffold product name image`
- Open `config/routes.rb` and set the root url: `root 'products#index'`

### 6°:
- Create a new file inside `app/assets/javascripts` called `cam.js` with this content:
```js
function take_snapshot(){
    Webcam.snap(function(data_uri) {
        id = $('[id*="_image"]');

        if (id.length) {
            id.val(data_uri);
        }

        document.getElementById('results').innerHTML = '<img src="' + data_uri + '"/>';
    });
}
$(document).ready(function() {
    if ($("#my_camera").length) {
        Webcam.set({
            width: 320,
            height: 240,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#my_camera');
    }
});
```
- Now you have to add the calling inside the view:
```erb
<%= form_for(@product) do |f| %>
  <div id="my_camera"></div>

  <input type=button value="Take Snapshot" onClick="take_snapshot()">

  <div class="field">
    <%= f.hidden_field :image %>
    <%= f.label :image %>: <br />
    <div id="results">Your captured image will appear here...</div>
  </div>

  ...
  <!-- Other fields and submit button -->
<% end %>
```
- Inside your model add the uploader:
```rb
class Product < ActiveRecord::Base
  mount_base64_uploader :image, ProductImageUploader
end
```

**That is it! just use your rails application with a webcam in it!**
Any problem, please add a new [Issue](https://github.com/brunoocasali/webcamjs-plus-rails/issues)
Dudes? See the source code.

// Entry point for the build script in your package.json
// Entry point for the build script in your package.json
import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import "bootstrap";
import "./controllers";

window.Rails = Rails;

//= require jquery
//= require bootstrap
//= require rails-ujs
//= require_tree .
//= require rails-ujs


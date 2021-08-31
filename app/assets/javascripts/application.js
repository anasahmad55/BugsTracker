// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var featureOrBug = {
    bug: ["new", "started", "resolved"],
    feature: ["new", "started", "complete"],
}

function changeStatus(value) {
    if (value.length == 0) document.getElementById("bug_status").innerHTML = "<option></option>";
    else {
        var statusOptions = "";
        for (id in featureOrBug[value]) {
            statusOptions += "<option>" + featureOrBug[value][id] + "</option>";
        }
        document.getElementById("bug_status").innerHTML = statusOptions;
    }
}

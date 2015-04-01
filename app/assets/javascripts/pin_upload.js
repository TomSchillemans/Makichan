/**
 * Created by tomschillemans on 31/03/15.
 */
$(document).ready(function(){
    // disable auto discover
    Dropzone.autoDiscover = false;

    // grap our upload form by its id
    $("#new_pin").dropzone({
        // restrict amount of files to be uploaded to 1 and set accepted files only to images
        maxFiles: 1,
        acceptedFiles: 'image/*',
        previewsContainer: '.dropzone-previews',
        // changed the passed param to one accepted by
        // our rails app
        paramName: "pin[image]",
        // show remove links on each image upload
        addRemoveLinks: true,
        autoProcessQueue:false
    });
});

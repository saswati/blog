<script type='text/javascript' charset='UTF-8'>
$(document).ready(function(){
    $('form[data-remote]').bind("ajax:before", function(){
        for (instance in CKEDITOR.instances){
            CKEDITOR.instances[instance].updateElement() ;
        }
});
});
</script>
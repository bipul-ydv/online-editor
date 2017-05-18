/**
 * Created by parul on 18/5/17.
 */
$(document).ready(function() {
    $('#olvidado').click(function(e) {
        e.preventDefault();
        $('div#form-olvidado').toggle('500');
    });
    $('#acceso').click(function(e) {
        e.preventDefault();
        $('div#form-olvidado').toggle('500');
    });
});
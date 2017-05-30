<html>
<head>
<style>
    .searchDetails{

        margin-top: 40px;
        margin-left: 40px;
        line-height: 200%;
    }
</style>
</head>
<body>
<script>
    function getUserDetails() {
        console.log("asdfads");
        var username = $("#username").val();
        $.ajax({
            url: "/admin/searchUserDetails",
            data: {
              "username" : username
            },
            success: function(result){
            $("#searchContainer").html(result);
        }});
    }
</script>
<h2>Enter User Name</h2>
    <g:if test="${flash.message}">
        <div class="message" role="status" style="font-size: medium;color: green;">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="message_error" style="font-size:medium; color: red;">${flash.error}</div>
    </g:if>
    <label for = "username">Username:</label>
    <g:textField name="username"></g:textField>
    <input type="button" onclick = "getUserDetails()" value="search">
    <div id="searchContainer" class="searchDetails"></div>
</body>
</html>
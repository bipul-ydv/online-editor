<html>
<head>
    <style>
        .list-group-item{
            border-color:  #428bca;
        }
    </style>
</head>
<body>

    <ul class="list-group">

<h4 class="list-group-item-heading"><span style="color: #428bca;"> Search User Details:</span></h4>

<li class="list-group-item"><span style="color: #428bca;">Username:</span>  ${user?.username}</li>

<li class="list-group-item"><span style="color: #428bca;">Email: </span> ${user?.email}</li>

<li class="list-group-item"><span style="color: #428bca;">DOB:  </span>${user?.dob}</li>

<li class="list-group-item"><span style="color: #428bca;">City: </span> ${user?.city}</li>

<li class="list-group-item"><span style="color: #428bca;">Street:</span>  ${user?.street}</li>

<li class="list-group-item"><span style="color: #428bca;">Gender:</span>  ${user?.gender}</li>

<li class="list-group-item"><span style="color: #428bca;">SignUp Date:</span>  ${user?.dateCreated}</li>
    </ul>

</body>
</html>
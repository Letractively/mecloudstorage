var oMyDate = new Date();
var iYear = oMyDate.getFullYear();
var iMonth = oMyDate.getMonth() + 1;
var iDate = oMyDate.getDate();
var iDay = oMyDate.getDay();
switch (iDay) {
case 0:
	iDay = "Sunday";
	break;
case 1:
	iDay = "Monday";
	break;
case 2:
	iDay = "Tuesday";
	break;
case 3:
	iDay = "Wednesday";
	break;
case 4:
	iDay = "Thursday";
	break;
case 5:
	iDay = "Friday";
	break;
case 6:
	iDay = "Satday";
	break;
default:
	iDay = "error";
}
document.write("Today is " + iYear + "/" + iMonth + "/" + iDate + "," + iDay);
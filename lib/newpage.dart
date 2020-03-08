

int clearamount;
int totalamount;
var dropdownValue = '1kg';
// for calculating price
pricecalculator() {
  if (dropdownValue == '1kg') {
    clearamount = totalamount * 1;
  } else if (dropdownValue == '2kg') {
    clearamount = totalamount * 2;
  } else if (dropdownValue == '3kg') {
    clearamount = totalamount * 3;
  } else if (dropdownValue == '4kg') {
    clearamount = totalamount * 4;
  } else if (dropdownValue == '5kg') {
    clearamount = totalamount * 5;
  }
  
  }



  







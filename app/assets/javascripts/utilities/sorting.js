document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title');

  if (control) { control.addEventListener('click', sortRowsByTitle); }
})


function sortRowsByTitle() {
  var table = document.querySelector('table');
  var rows =table.querySelectorAll('tr');
  var sortedRows = [];
  var arrow_up_cL = this.querySelector('.octicon-arrow-up').classList;
  var arrow_down_cL = this.querySelector('.octicon-arrow-down').classList;
  var sortedTable = document.createElement('table');

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }

  if (arrow_up_cL.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    arrow_up_cL.remove('hide');
    arrow_down_cL.add('hide');
  } else {
    sortedRows.reverse();
    arrow_up_cL.add('hide');
    arrow_down_cL.remove('hide');
  }

  sortedTable.classList.add('table');
  sortedTable.classList.add('table-sm');
  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);

}


function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent;
  var testTitle2 = row2.querySelector('td').textContent;

  return (testTitle1 < testTitle2) ? -1 : 1;
}

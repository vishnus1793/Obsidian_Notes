function getTop50IndiaCovidRows() {
  const url = "https://covid.ourworldindata.org/data/owid-covid-data.csv";
  const response = UrlFetchApp.fetch(url);
  const data = response.getContentText();
  const rows = Utilities.parseCsv(data);
  
  if (!rows || rows.length === 0) {
    Logger.log("No data fetched.");
    return;
  }

  const header = rows[0];  // First row (header)
  const indiaData = [header];  // Include header in the result
  let count = 0;

  // Loop through rows, filter by continent and location, and fetch first 50
  for (let i = 1; i < rows.length && count < 50; i++) {
    if (rows[i][1] === "Asia" && rows[i][2] === "India") {  // Continent is in column 2 (index 1), Location in column 3 (index 2)
      indiaData.push(rows[i]);
      count++;
    }
  }

  if (indiaData.length === 1) {
    Logger.log("No India data found.");
    return;
  }

  // Output data to active sheet
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  sheet.clear();  // Clear any existing data
  sheet.getRange(1, 1, indiaData.length, indiaData[0].length).setValues(indiaData);
}


##  -------------------------------------
##  SUMMARY
##  -------------------------------------

This report is NOT authoritive, it is designed to provide content to support a discussion about
the data presented.  The data is only as reliable as the clients reporting the values.

This report template exports a CSV file suitable for import into a spreadsheet.
The report calculates it's own totals and does not rely on any spreadsheet functions or post calculation methods.

Pretty straight forward report details include:
  + product SKU consumption
  + socket and core count totals for VMs and baremetal hosts
  + hardware inventory counts
  + software inventory
  + more...

##  -------------------------------------
##  PROCEDURE
##  -------------------------------------

1. save the erb file to your system
2. log into satellite WebUI
3. goto Administer->Settings
4. in the search bar, type "safemode"
5. hit the pencil icon next to Yes/No, and set the value to "No"
6. now, goto Monitor -> Report Templates
7. click Create Template
8. click the Import button (answer "Yes" to override editor content) and upload the saved erb
     NOTE: on newer versions of satellite, the Import button is a folder icon on the editor tool bar
9. you may need name the report in the dialog, use: "Overview Report for Sat-6.6"
9. then click to save (or submit) the template
10. now you should be able to "Generate" the report for "Overview Report for Sat-6.6"

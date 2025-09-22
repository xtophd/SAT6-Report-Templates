
##  -------------------------------------
##  SUMMARY
##  -------------------------------------

There are 2 reports in this project:
    Overview-Report-Sat-6.6.erb
        - requires safemode be disabled
        - aggregates more information dynamically 
    Overview-Report-2025.erb
        - does NOT require safemode be disabled
        - collects similar information
        - tested with Satellite v6.16

These reports are NOT authoritive, they are designed to provide content to support a discussion about
the data presented.  The data is only as reliable as the clients reporting the values.

This report template exports a CSV file suitable for import into a spreadsheet.

Pretty straight forward report details (can) include:
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
3. if you opt to run the more thorough report:
       goto Administer->Settings
       in the search bar, type "safemode"
       hit the pencil icon next to Yes/No, and set the value to "No"
4. now, goto Monitor -> Report Templates
5. click Create Template
6. click the Import button (answer "Yes" to override editor content) and upload the saved erb
     NOTE: on newer versions of satellite, the Import button is a folder icon on the editor tool bar
7. you may optionally rename the report in the dialog, use: "Overview Report"
8. then click to save (or submit) the template
9. now you should be able to "Generate" the report for "Overview Report"

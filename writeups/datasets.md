What is interesting about this dataset? (Note that this can mean a lot of things - the data was for an interesting/timely topic, the data was interesting (probably difficult) to work with, the applications of the this data are interesting, etc.)

 - 

Where was the data obtained?

 - 

What license restrictions are there on the use of the data? (Note a website providing data automatically copyrights that data unless it has terms and conditions stating otherwise - be sure you have permission to use that data in your project.)

 - 

Describe the tables and significant attributes as loaded into the database, include an ER diagram of your datasets and note the interesting relationships between entities. This should be of the normalized datasets, not the original datasets, if the two differ.

 - 

An analysis of the at least 3NF nature of your datasets (BCNF is stronger than 3NF and can be used to meet this requirement).

 - 

Data loading or manipulation often requires transactions to ensure an all-or-none result; what steps were taken to ensure that? how were transactions or verification of data employed?

 - 

Data is constantly changing; discuss how much your dataset might grow over the next 10 years if it were maintained, and estimate its future size based on its present size and that growth rate. This estimate should be stated in pages and take account of storage overhead (not just the data itself) as was done in class.

 - `obesity_data` contains data by city by year, so if kept up-to-date it will grow every year. The size of each page is found with the equation:

$$\text{Page overhead} + \text{Number of rows} \cdot (\text{Row overhead} + \sum \text{Data field size} + \text{Data field overhead})$$

Discuss how your work meets SQL Security concerns; what permissions were used to ensure no unneeded access occurred to the data? how was SQL Injection avoided? What next steps might you use to beef up security if you continued with your project?

 - 

# Gato
The Texas State University implementation of Magnolia CMS.

* In the old Gato, the parent organization was stored as collegeLink->name and collegeLink->url.  This doesn't work
  with the new yaml configuration because "name" is what they use to create the content node that the properties go under.
  So if you set the name and url to be "my department" and "my url", it would create my-department->"my department" and 
  my-department->"my url" instead of putting the properties under collegeLink.
  
* I renamed the collegeLink node "parentOrganization" and it has 2 properties: parent_name and url.
The following script can be run in Windows PowerShell to automatize reconstruction of multiple datasets after splitting the datasets with spl or spl_c. The script first performs a single slice reconstruction, then uses the automatically determined center of rotation to start the full reconstruction.

The script needs to be placed into scan\raw, not in , not in scan\raw\001\raw
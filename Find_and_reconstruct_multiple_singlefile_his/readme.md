# Batch script for reconstructing multiple standard tomography datasets acquired at SPring-8 beamline BL20B2.

Calls custom BL20B2 software written by Kentaro Uesugi for reconstruction:
http://www-bl20.spring8.or.jp/xct/index-e.html

This Windows PowerShell script searches a folder recursively for raw Hamamatsu .his files containing projections and reconstructs them per standard reconstruction (via hp_tg_g_c), with automatic center of rotation determination (via ct_rec_g_c).

Output reconstructed 3D datasets are stored in a newly created folder within the same directory as the corresponding .his file.

This works only for data with a single standard tomography per .his file, that can be unpacked with the default conv.bat script generated by the acquisition software. This batch-script does not deal with datasets containing more than one tomography per .his or skipped flat-field acquisition.
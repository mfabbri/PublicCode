# partialappUpdate.py
#     Execute a partialapp Update of the application
#     partialappUpdate.py applicationName zipFile
# 

import sys

argLen = len(sys.argv)
if (argLen < 2):
    print "Error: Wrong parameters number"
else:
    applicationName = sys.argv[0]
    zipFile = sys.argv[1]
    print "Updating " + applicationName + " with zip file " + zipFile + "..."
    AdminApp.update(applicationName, 'partialapp', '[-contents ' + zipFile + ']')
    AdminConfig.save()
    print "partialapp Update ended"
#endif


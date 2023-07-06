#!../../bin/linux-x86_64/acsMotion

< envPaths
< envVars

cd "${TOP}"
## Register all support components
dbLoadDatabase "dbd/acsMotion.dbd"
acsMotion_registerRecordDeviceDriver pdbbase

## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=$(PREFIX)")

cd "${TOP}/iocBoot/${IOC}"
< AcsMotion.cmd
##
#< AcsMotionAuxIO.cmd

iocInit

## motorUtil (allstop & alldone)
motorUtilInit("$(PREFIX)")


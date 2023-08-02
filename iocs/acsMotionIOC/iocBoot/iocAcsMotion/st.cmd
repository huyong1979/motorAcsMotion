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

set_savefile_path("./as","/save")
set_requestfile_path("./as","/req")
set_pass0_restoreFile("collimators.sav")

iocInit

## motorUtil (allstop & alldone)
motorUtilInit("$(PREFIX)")

makeAutosaveFileFromDbInfo("./as/req/collimators.req", "autosaveFields_pass0")
create_monitor_set("collimators.req", 15, "")

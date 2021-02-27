# Use the following line if motorAcsMotion is built as a submodule of motor
#!iocshLoad("$(MOTOR)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=10.0.0.100,NUM_AXES=8,IDLE_POLL=0.2")
# Use the following line if motorAcsMotion is built as a standalone module
iocshLoad("$(MOTOR_ACSMOTION)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=10.0.0.100,NUM_AXES=8,IDLE_POLL=0.2")

# Load motor records
dbLoadTemplate("AcsMotion.substitutions")

# Load an asyn record for debugging
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=acsMotion:,R=asyn,PORT=ACS1_ETH,ADDR=0,OMAX=256,IMAX=256")
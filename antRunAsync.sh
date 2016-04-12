#!/bin/sh
# antRunAsync - Wrapper script to run an executable detached in the
# background from Ant's <exec> task. This works be redirecting stdin,
# stdout and stderr so Ant finds them closed and doesn't wait for the
# program to exit.
#
# usage:
# <exec executable="antRunAsync.sh" failonerror="yes">
# <env key="ANTRUN_NOHUP" value="true" /> <!-- optional -->
# <env key="ANTRUN_OUTPUT" value="output.log" /> <!-- required -->
# <arg value="real executable" />
# </exec>

# If ANTRUN_NOHUP environment variable is set to true/yes/nohup, run the
# executable prefixed with "nohup" making it immune to logging out.
case "$ANTRUN_NOHUP" in
true|yes|nohup) ANTRUN_NOHUP=nohup ;;
*) unset ANTRUN_NOHUP ;;
esac

# ANTRUN_OUTPUT environment variable must be set to output file name or
# executable can't run detached
if [ -n "$ANTRUN_OUTPUT" ]
then
$ANTRUN_NOHUP $@ </dev/null > "$ANTRUN_OUTPUT" 2>&1 &
exit 0
else
echo "$0: ERROR: variable ANTRUN_OUTPUT must be set to output file
name!"
exit 1
fi
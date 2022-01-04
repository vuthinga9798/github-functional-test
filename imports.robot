*** Settings ***
Resource          ../1_common/imports.robot
Variables         ../config_${env}.yaml
Library           Selenium2Library       run_on_failure=${run_on_failure}     timeout=10.0     implicit_wait=0.0
Library           Collections
Library           ../0_resources/pythonlibs/util.py

from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
import os
import platform

context = BuiltIn().get_library_instance('Selenium2Library')


def get_driver_path():
    cur_dir = os.path.dirname(os.path.realpath(__file__))
    system = platform.system()
    print(system)

    if system == "Darwin":
        return cur_dir + "/drivers/mac/chromedriver"

def start_chrome_browser(url):
    options = webdriver.ChromeOptions()
    options.add_argument("--window-size=1440,900")
    options.add_argument("--ignore-certificate-errors")
    context.create_webdriver('Chrome', options=options, executable_path=get_driver_path())
    context.go_to(url)

def start_chrome_headless_browser(url):
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    options.add_argument("--window-size=1440,900")
    options.add_argument("--ignore-certificate-errors")
    context.create_webdriver("Chrome", options=options, executable_path=get_driver_path())
    context.go_to(url)

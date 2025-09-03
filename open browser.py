import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

service = Service(ChromeDriverManager().install())

driver = webdriver.Chrome(service=service)

driver.get("https://4basecare.com/")
print(driver.title)
print(driver.current_url)
time.sleep(5)


from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager

service = Service(GeckoDriverManager().install())
driver = webdriver.Firefox(service=service)

driver.get("https://4basecare.com/")
print(driver.title)
print(driver.current_url)
time.sleep(5)




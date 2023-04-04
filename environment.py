from browser import Browser
from pages.inventory_page import InventoryPage
from pages.login_page import LoginPage


def before_all(context):
    context.browser = Browser()
    context.login_page_object = LoginPage()
    context.inventory_page_object = InventoryPage()


def after_all(context):
    context.browser.close()

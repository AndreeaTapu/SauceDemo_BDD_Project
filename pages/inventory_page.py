from generic_page_methods import GenericPageMethods


class InventoryPage(GenericPageMethods):

    def check_current_url(self):
        self.expected_url = "https://www.saucedemo.com/inventory.html"
        self.actual_url = self.chrome.current_url
        assert self.expected_url == self.actual_url, "Error: invalid URL"

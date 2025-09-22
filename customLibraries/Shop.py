import self
from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary import SeleniumLibrary

@library
class Shop:

     def __init__(self):
        self.selLib= BuiltIn().get_library_instance("SeleniumLibrary")


     @keyword
     def hello_world(self):
         print("hello")
         # method name will be converted to keyword hello world
     @keyword
     def add_items_to_cart_and_checkout(self, productsList):
         # i=1
         # productsTitles = self.selLib.get_webelements("css:.card-title")
         # for productsTitle in productsTitles:
         #     if productsTitle.text in productsList:
         #         self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
         #
         #    i = i + 1

         productsTitles = self.selLib.get_webelements("css:.card-title")

         for i, productsTitle in enumerate(productsTitles, start=1):
            if productsTitle.text in productsList:
                self.selLib.click_button(f"xpath:(//*[@class='card-footer'])[{i}]/button")

     # Click on Cart/Checkout after adding all items

         self.selLib.click_element("xpath=//a[@class ='nav-link btn btn-primary']")
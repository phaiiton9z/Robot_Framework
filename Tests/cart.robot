*** Settings ***
Resource    ../Keywords/features/login/login_features.robot
Resource    ../Keywords/features/cart/add_cart_features.robot
Variables   ../Resources/test_data/user.yaml
Variables   ../Resources/test_data/cart/test_data.yaml

test Setup    Run Keywords     Open Browser and go to website '${url.saucedemo}'
...    AND    Login with username '${correct.username}' and password '${correct.password}'

Task Tags    cart

*** Test Cases ***
Add 1 item to cart and verify
    [Documentation]    Add an item to the cart and verify the cart count and item presence.

    Add item to cart with name '${cart_tc001.product_id}'
    Verify icon cart is counting items ${cart_tc001.quantity}
    Verify item in cart with name '${cart_tc001.product_name}' and price '${cart_tc001.total_price}' in row 1

Add 2 items to cart and verify and check out
    [Documentation]    Add two items to the cart, verify the cart count and item presence, then proceed to checkout.

    Add item to cart with name '${cart_tc002.product_1.product_id}'
    Verify icon cart is counting items 1
    Verify item in cart with name '${cart_tc002.product_1.product_name}' and price '${cart_tc002.product_1.total_price}' in row 1
    click continue shopping
    Add item to cart with name '${cart_tc002.product_2.product_id}'
    Verify icon cart is counting items 2
    Verify item in cart with name '${cart_tc002.product_2.product_name}' and price '${cart_tc002.product_2.total_price}' in row 2


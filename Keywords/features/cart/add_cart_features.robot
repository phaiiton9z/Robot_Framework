*** Settings ***
Resource    ../../common_keywords.robot

*** Keywords ***
Add item to cart with name '${item}'
    Click element when ready    id=add-to-cart-${item}

Verify icon cart is counting items ${count}
    ${test}    Get Text    //span[@data-test="shopping-cart-badge"]   
    Should Be Equal As Integers    ${count}     ${test}

Verify item in cart with name '${item}' and price '${price}' in row ${row}
    Click element when ready    //a[@data-test="shopping-cart-link"]
    Get Text    (//div[@class="inventory_item_name"])[${row}]         Should be   ${item}
    Get Text    (//div[@data-test="inventory-item-price"])[${row}]    Should be   ${price}

click continue shopping
    Click element when ready       //button[@data-test="continue-shopping"]

Checkout cart
    Click element when ready       //button[@data-test="checkout"]

Input information for checkout with first name '${first_name}', last name '${last_name}', and zip code '${zip_code}'
    Input text when ready        //input[@data-test="firstName"]    ${first_name}
    Input text when ready        //input[@data-test="lastName"]     ${last_name}
    Input text when ready        //input[@data-test="postalCode"]   ${zip_code}
    Click element when ready     //input[@data-test="continue"]

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract Product {
    uint public max_products = 1000000;

    function products() external view returns (uint) {
        return max_products;
    }
    
    ProductItem[] public productItems;

    struct ProductItem{
        address creator;
        string productName;
        uint256 productId;
        string date;
    }
    
    
    
    function addProductItem(string memory _text, string memory _date, uint256 _id) public returns (bool) {
        ProductItem memory newItem = ProductItem({creator: msg.sender, productName: _text, productId: _id, date: _date});
        productItems.push(newItem);
        return true;
    }

    function getProductItems() public returns (uint256[] memory, string[] memory) {
        uint length = productItems.length;

        uint256[] memory ids = new uint256[](length);
        string[] memory productNames = new string[](length);

        for (uint i = 0; i < length; i++) {
            ids[i] = productItems[i].productId;
            productNames[i] = productItems[i].productName;
        }

        return (ids, productNames);
    }
    
    function deleteProductItem(uint index) public returns (bool success) {
        if (index >= productItems.length) return false;

        for (uint i = index; i < productItems.length - 1; i++){
            productItems[i] = productItems[i+1];
        }

        delete productItems[productItems.length - 1];
        return true;
    }
    
}
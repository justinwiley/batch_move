# Batch Move

A low-brow method for batch renaming files that match a particular pattern, using Git.  Cherry-picked out of a Rails app, but usable in anything (given you use Git, and theres a ruby interpreter to run the script).

## Usage

Imagine you have a class app/models/item.rb, and you want to rename it and everything item-like to product.

Drop batch_move.rb somewhere in your project, chmod +x to make it executable.

```bash
$ ./batch_move.rb item product

Batch renaming via git anything I find with 'item' to 'product'

Found 4 files

/home/user/my-proj/db/migrate/20140304162801_create_items.rb               will become /home/user/my-proj/db/migrate/20140304162801_create_products.rb
/home/user/my-proj/test/fixtures/items.yml                                 will become /home/user/my-proj/test/fixtures/products.yml
/home/user/my-proj/test/models/item_test.rb                                will become /home/user/my-proj/test/models/product_test.rb
/home/user/my-proj/app/models/item.rb                                      will become /home/user/my-proj/app/models/product.rb

Proceed? Y/n: 
```

Case sensitive Y will execute "git mv" to rename the files.  It will NOT commit the changes, leaving you a chance to reset.

### Warning: Read the code

The script is a quick hack, review the code to make sure you understand what it does before launching it.

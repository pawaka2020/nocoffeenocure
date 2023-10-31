User uses app for first time.

App checks to see if token inside app.
If no token, create guest token, then create User object for the guest token.
If register, create registered token, then create User object for the registered token.
then load User object from database.

inside User object that contains guest token, name field is always 'Guest'

if got token, load the token, then use that token to load User object from database.

run token through getUserId(token) function to obtain user_id, then use that use_id to locate User from database.

When proceed to checkout, add to Order object with 'user_id' as one of the fields. 

Each CartItem object should also have a 'user_id' field.

ObjectBox models to create:
- User
- CartItem
- Order
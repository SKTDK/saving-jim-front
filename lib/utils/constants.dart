library constants;

// User types
const int MANAGER_ACCOUNT_TYPE = 1;
const int CHILD_ACCOUNT_TYPE = 3;
const int PERSONOFCONTACT_ACCOUNT_TYPE = 2;
const int ADMINISTRATOR_ACCOUNT_TYPE = 0;

// ip address without / at the bend
// We combine both ip and address because if you host on Heroku it will be default redirected to port 80, thus the url.
const String SERVER_ADDRESS_ANDROID = 'https://saving-jim-dev.herokuapp.com';
const String SERVER_ADDRESS_IOS = 'https://saving-jim-dev.herokuapp.com';

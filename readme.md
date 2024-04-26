Before running this apk file:
1 - Make sure the backend https://github.com/pawaka2020/ncncbackend is run first. 
2 - Make sure the IP4 address set in 'onlineBackendURL' in common.dart matches IPV4_ADDRESS value in 
config.py in online backend.
3 - Make sure there are no existing entries in 'users' collection in MongoDB in backend, if in the 
debug/development phase.
4 - Let the phone use the same online connection source as the backend first. 
5 - Then launch the apk file.

The Flutter app starts with main()
main() defines some singletons 

main() -> SplashScreen()
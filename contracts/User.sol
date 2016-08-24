import 'StringMap2.sol';

contract User {

  using StringMap2 for StringMap2.sMap;
  StringMap2.sMap props;

  function User() {
    props.insert("name", "John Smith");
    props.insert("address", "999 Main Street");
    props.insert("phone", "778-333-4444");
  }

  function checkProp(string key) returns (bool exists) {
    exists = props.contains(key);
    return exists;
  }

  function removeProp(string key) returns (bool deleted) {
    deleted = props.remove(key);
    return deleted;
  }

  function countStrings() returns (uint count) {
    // Iteration
    for (var i = StringMap2.iterate_start(props); StringMap2.iterate_valid(props, i); i = StringMap2.iterate_next(props, i)) {
      //var (key, value) = StringMap2.iterate_get(props, i);
      count++;
    }
  }

}

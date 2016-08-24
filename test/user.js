contract('User', function() {
  it("should assert true", function() {
    var user = User.deployed();
    assert.isTrue(true);
  });
  it("Should set the name ", function() {
    var user = User.deployed();
    return user.checkProp.call("name").then(function (exists) {
      assert.isTrue(exists, "Name not set!");
    });
  });
  it("Should set the address ", function() {
    var user = User.deployed();
    return user.checkProp.call("address").then(function (exists) {
      assert.isTrue(exists, "Address not set!");
    });
  });
  it("Should set the phone number ", function() {
    var user = User.deployed();
    return user.checkProp.call("phone").then(function (exists) {
      assert.isTrue(exists, "Phone number not set!");
    });
  });
  it("Should delete the address ", function() {
    var user = User.deployed();
    return user.removeProp.call("address").then(function (deleted) {
      assert.isTrue(deleted, "Address not deleted!");
    });
  });
  it("Should contain three strings ", function() {
    var user = User.deployed();
    return user.countStrings.call().then(function (number) {
      assert.equal(number.valueOf(), 3, "Doesn't contain three strings!");
    });
  });
});

// assert.equal(quota, 500, "Quota is wrong!");
// assert.equal(props.properties[name], "hiroshi", "Wrong name.");

//user.props.properties[name].call().then(function (name) {
//  assert.equal(user.props.properties[name], "hiroshi", "Name is wrong!");
//  done();

/* it("Should set the quota and address ", function(done) {
  var user = User.deployed();
  user.quota.call().then(function (quota) {
    assert.equal(quota, 500, "Quota value is wrong!");
  }).then(function () {
    return user.checkProp.call();
  }).then(function (check) {
    assert.isTrue(check, "The address is wrong!");
    done();
  }); */

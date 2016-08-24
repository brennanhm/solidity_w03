module.exports = function(deployer) {
  deployer.deploy(StringMap2);
  deployer.deploy(User);
  deployer.autolink();
};

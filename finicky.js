// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Safari",
  options: {
    hideIcon: true,
    checkForUpdate: false
  },
  handlers: [
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: [
        finicky.matchDomains(/bbb.neopoly.com/) // use helper function to match on domain only
      ],
      browser: "Google Chrome"
    }
  ]
}

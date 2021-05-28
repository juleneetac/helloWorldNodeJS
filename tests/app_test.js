var server   = require('../index'),
    chai     = require('chai'),
    chaiHTTP = require('chai-http'),
    should   = chai.should();

chai.use(chaiHTTP);

reqServer = 'http://localhost:8080'

describe('Basic routes tests', function() {

    it('GET to / should return 200', function(done){
        chai.request(reqServer)
        .get('/')
        .end(function(err, res) {
            res.should.have.status(200);
            done();
        })

    })
})

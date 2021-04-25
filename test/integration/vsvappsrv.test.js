//Check for Entities and properties
const axios = require('axios');
const cds = require('@sap/cds');

describe('WM cap service test', () => {

    beforeAll(async () => {
        const serviceEntities = Object.values(
            cds.reflect(cds.model).entities('vsvappsrv')
        ).filter(
            (value) => !value['@cds.autoexposed'] && !value.elements['up_']
        )
    });

    it('Test 1',async() => {
        expect(1).toBe(1);
    });

});
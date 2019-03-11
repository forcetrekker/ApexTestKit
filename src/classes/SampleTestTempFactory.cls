@isTest
public with sharing class SampleTestTempFactory implements ATKWizard.IWizardTemplate {
    public static final String ACCOUNT_WITH_FAX = 'SampleTestDataFactory/ACCOUNT_WITH_FAX';
    public static final String CONTACT_WITH_EMAIL = 'SampleTestDataFactory/CONTACT_WITH_EMAIL';

    void buildAccountWithFax(ATKWizard.IEntityKeywords accountEntity) {
        accountEntity
            .fields()
                .guard()
                .eval(Account.Fax).fake('{{1##-###-####}}')
                .eval(Account.NumberOfEmployees).number(8, 0)
                .eval(Account.Industry).guess()
            .end();
    }

    void buildContactWithEmail(ATKWizard.IEntityKeywords contactEntity) {
        contactEntity
            .fields()
                .guard()
                .eval(Contact.FirstName).firstName()
                .eval(Contact.LastName).lastName()
                .eval(Contact.Birthdate).past()
                .eval(Contact.Email).email()
            .end();
    }

    public void build(ATKWizard.IEntityKeywords entity, String templateName) {
        if (templateName == ACCOUNT_WITH_FAX) {
            buildAccountWithFax(entity);
        } else if (templateName == CONTACT_WITH_EMAIL) {
            buildContactWithEmail(entity);
        }
    }
}